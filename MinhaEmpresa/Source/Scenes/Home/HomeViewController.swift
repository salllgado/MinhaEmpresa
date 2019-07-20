//
//  HomeViewController.swift
//  MinhaEmpresa
//
//  Created by Chrystian Salgado on 20/07/19.
//  Copyright © 2019 Salgado's Production. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var lblRazao: UILabel!
    @IBOutlet weak var lblCNPJ: UILabel!
    @IBOutlet weak var lblTipo: UILabel!
    
    var viewModel: HomeViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        self.title = viewModel.enterprise?.nickname
        lblRazao.text = viewModel.enterprise?.enterpriseName
        lblCNPJ.text = viewModel.enterprise?.cnpj
        lblTipo.text = viewModel.enterprise?.type
    }
}
