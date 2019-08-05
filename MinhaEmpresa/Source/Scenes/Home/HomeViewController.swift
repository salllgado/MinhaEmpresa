//
//  HomeViewController.swift
//  MinhaEmpresa
//
//  Created by Chrystian Salgado on 20/07/19.
//  Copyright © 2019 Salgado's Production. All rights reserved.
//

import UIKit
import NetworkKit

protocol HomeViewControllerDelegate: class {
    func navigate(param: Enterprise)
}

class HomeViewController: UIViewController {
    
    //static labels
    @IBOutlet weak var lblRazaoTitle: UILabel!
    @IBOutlet weak var lblCNPJTitle: UILabel!
    @IBOutlet weak var lblActivityTitle: UILabel!
    
    @IBOutlet weak var lblRazao: UILabel!
    @IBOutlet weak var lblCNPJ: UILabel!
    @IBOutlet weak var lblTipo: UILabel!
    
    var viewModel: HomeViewModel!
    var delegate: HomeViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        viewModel.saveEnterpriseIdentification()
    }
    
    func setupUI() {
        self.title = viewModel.enterprise?.nickname
        lblRazao.text = viewModel.enterprise?.enterpriseName
        lblCNPJ.text = viewModel.enterprise?.cnpj
        lblTipo.text = viewModel.enterprise?.firstActivity.first?.text
        
        // setup static labels
        lblRazaoTitle.text = NSLocalizedString("RAZAO_TITLE", comment: "")
        lblCNPJTitle.text = NSLocalizedString("CNPJ_TITLE", comment: "")
        lblActivityTitle.text = NSLocalizedString("ENTERPRISE_TIPE_TITLE", comment: "")
    }
    
    @IBAction func actionMoreDetails(_ sender: Any) {
        guard let _enterprise = viewModel.enterprise else { return }
        delegate?.navigate(param: _enterprise)
    }
}
