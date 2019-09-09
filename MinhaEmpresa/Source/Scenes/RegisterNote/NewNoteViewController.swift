//
//  NewNoteViewController.swift
//  Feature
//
//  Created by Chrystian Salgado on 18/08/19.
//  Copyright © 2019 Salgado's Production. All rights reserved.
//

import UIKit
import StyleKit

protocol NewNoteViewControllerDelegate: class {
    func navigate()
}

class NewNoteViewController: UIViewController {
    
    @IBOutlet weak var noteCNPJTf: MyTextField!
    @IBOutlet weak var enterpriseNameTf: MyTextField!
    @IBOutlet weak var noteValueTf: MyTextField!
    @IBOutlet weak var noteDateTf: MyTextField!
    @IBOutlet weak var paymentDateTf: MyTextField!
    @IBOutlet weak var btnSaveNote: UIButton!
    
    var viewModel: NewNoteViewModel?
    private var loadingView: LoadingView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        noteValueTf.delegate = self
        setupUI()
    }
    
    private func setupUI() {
        title = Localizer.stringProj("NEW_NOTE_TITLE")
        btnSaveNote.setTitle(Localizer.stringProj("SAVE_NOTE_BUTTON"), for: .normal)
        
        noteCNPJTf.formatting = .cnpj
        noteDateTf.formatting = .date
        paymentDateTf.formatting = .date
        
        loadingView = LoadingView(color: primaryColor)
    }
    
    @IBAction func actionSave(_ sender: Any) {
        let receipt = Receipt(cnpj: noteCNPJTf.text ?? "",
                           enterpriseName: enterpriseNameTf.text ?? "",
                           value: noteValueTf.text ?? "",
                           date: noteDateTf.text ?? "",
                           paymentDate: paymentDateTf.text)
        
        viewModel?.saveData(receipt)
    }
}

extension NewNoteViewController: NewNoteDelegate {
    
    func loading(_ show: Bool) {
        show ? loadingView?.showLoading(in: self.view) : loadingView?.dismissLoading()
    }
    
    func showAlert(_ actions: [UIAlertAction]) {
        self.showAlertController(title: "Tente novamente", message: "Existem dados em branco, preencha novamente e tente novamente.", actions: actions)
    }
}

extension NewNoteViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let currencyString = Localizer.stringProj("STRING_CURRENCY")
        
        if textField == noteValueTf, let text = textField.text, !text.contains(currencyString) {
            noteValueTf.text = currencyString + " \(textField.text ?? "")"
        }
        
        return true
    }
}
