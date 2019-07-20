//
//  ViewController.swift
//  MinhaEmpresa
//
//  Created by Chrystian Salgado on 06/07/19.
//  Copyright © 2019 Salgado's Production. All rights reserved.
//

import UIKit

protocol MainViewControllerDelegate: class {
    func navigate(with param: Enterprise)
}

class MainViewController: UIViewController {
    
    @IBOutlet weak var cnpjTf: CustomFormatter!
    
    var delegate: MainViewControllerDelegate?
    var viewModel: MainViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        
        cnpjTf.formatting = .CNPJ
    }
    
    @IBAction func sendData(_ sender: Any) {
        viewModel.loadData(cnpj: cnpjTf.text ?? "")
    }
}

extension MainViewController: MainViewModelDelegate {
    
    func serverResponds(send: Enterprise) {
        delegate?.navigate(with: send)
    }
    
    func loadingStart() {
        // ...
    }
    
    func loadingEnd() {
        // ...
    }
}
