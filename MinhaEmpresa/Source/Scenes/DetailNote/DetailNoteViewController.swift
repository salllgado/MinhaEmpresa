//
//  DetailNoteViewController.swift
//  MinhaEmpresa
//
//  Created by Chrystian Salgado on 21/09/19.
//  Copyright © 2019 Salgado's Production. All rights reserved.
//

import UIKit

protocol DetailNoteViewControllerDelegate: class {
    func callInformation()
}

class DetailNoteViewController: UIViewController {
    
    @IBOutlet weak var cnpjTextField: UILabel!
    @IBOutlet weak var enterpriseNameTextField: UILabel!
    @IBOutlet weak var noteValueTextField: UILabel!
    @IBOutlet weak var dateTextField: UILabel!
    @IBOutlet weak var paymentDateTextField: UILabel!
    
    var viewControllerDelegate: DetailNoteViewControllerDelegate?
    var viewModel: DetailNoteViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    /// Setup UI elements.
    func setupUI() {
        cnpjTextField.text = viewModel?.receipt?.cnpj
        enterpriseNameTextField.text = viewModel?.receipt?.enterpriseName
        noteValueTextField.text = viewModel?.receipt?.value
        dateTextField.text = viewModel?.receipt?.date
        paymentDateTextField.text = viewModel?.receipt?.paymentDate
    }
    
    @IBAction private func actionInformation(_ sender: Any) {
        viewControllerDelegate?.callInformation()
    }
}
