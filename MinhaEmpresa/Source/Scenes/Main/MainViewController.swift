//
//  ViewController.swift
//  MinhaEmpresa
//
//  Created by Chrystian Salgado on 06/07/19.
//  Copyright © 2019 Salgado's Production. All rights reserved.
//

import UIKit
import NetworkKit

protocol MainViewControllerDelegate: class {
    func navigate(with param: Enterprise)
}

class MainViewController: UIViewController {
    
    @IBOutlet weak var cnpjTf: CustomFormatter!
    
    var delegate: MainViewControllerDelegate?
    var viewModel: MainViewModel!
    let loadingView = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        cnpjTf.formatting = .CNPJ
        
        setupLoadingView()
        viewModel.getEnterpriseId()
    }
    
    private func setupLoadingView() {
        loadingView.color = .black
        loadingView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        loadingView.center = self.view.center
        self.view.addSubview(loadingView)
        self.view.bringSubviewToFront(loadingView)
    }
    
    @IBAction func sendData(_ sender: Any) {
        viewModel.loadData(cnpj: cnpjTf.text ?? "")
    }
}

extension MainViewController: MainViewModelDelegate {
    
    func serverResponds(send: Enterprise) {
        delegate?.navigate(with: send)
    }
    
    func setEnterpriseId(cnpj: String) {
        cnpjTf.text = cnpj
        sendData(UIButton())
    }
    
    func loadingStart() {
        loadingView.startAnimating()
    }
    
    func loadingEnd() {
        loadingView.stopAnimating()
    }
}
