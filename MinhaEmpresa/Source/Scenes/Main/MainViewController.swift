//
//  ViewController.swift
//  MinhaEmpresa
//
//  Created by Chrystian Salgado on 06/07/19.
//  Copyright © 2019 Salgado's Production. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, MainViewModelDelegate {
    
    @IBOutlet weak var lblCNPJNumber: UILabel!
    
    private var viewModel: MainViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = MainViewModel()
        viewModel.delegate = self
        
        viewModel.loadData()
    }
}
