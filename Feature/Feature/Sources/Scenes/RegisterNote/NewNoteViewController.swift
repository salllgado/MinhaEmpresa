//
//  NewNoteViewController.swift
//  Feature
//
//  Created by Chrystian Salgado on 18/08/19.
//  Copyright © 2019 Salgado's Production. All rights reserved.
//

import Foundation

protocol NewNoteViewControllerDelegate: class {
    func navigate()
}

class NewNoteViewController: UIViewController {
    
    @IBOutlet weak var noteCNPJTf: MyTextField!
    @IBOutlet weak var enterpriseNameTf: MyTextField!
    @IBOutlet weak var noteValueTf: MyTextField!
    @IBOutlet weak var noteDateTf: MyTextField!
    @IBOutlet weak var btnSaveNote: UIButton!
    
    var viewModel: NewNoteViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        noteValueTf.delegate = self
        setupUI()
    }
    
    private func setupUI() {
        title = Strings.NewNote.title
        btnSaveNote.setTitle(Strings.NewNote.btnNewNote, for: .normal)
        
        noteCNPJTf.formatting = .cnpj
        noteDateTf.formatting = .date
    }
    
    @IBAction func actionSave(_ sender: Any) {
        let receipt = Receipt(cnpj: noteCNPJTf.text ?? "",
                           enterpriseName: enterpriseNameTf.text ?? "",
                           value: noteValueTf.text ?? "",
                           date: noteDateTf.text ?? "")
        
        viewModel?.saveData(receipt)
    }
}

extension NewNoteViewController: NewNoteDelegate {
    
    func loading(_ show: Bool) {
        // ...
    }
}

extension NewNoteViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let currencyString = NSLocalizedString("CURRENCY_FORMAT", comment: "")
        
        if textField == noteValueTf, let text = textField.text, !text.contains(currencyString) {
            noteValueTf.text = currencyString + " \(textField.text ?? "")"
        }
        
        return true
    }
}
