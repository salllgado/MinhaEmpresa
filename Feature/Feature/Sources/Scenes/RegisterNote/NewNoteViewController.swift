//
//  NewNoteViewController.swift
//  Feature
//
//  Created by Chrystian Salgado on 18/08/19.
//  Copyright © 2019 Salgado's Production. All rights reserved.
//

import Foundation

struct Receipt: Encodable {
    var cnpj: String
    var enterpriseName: String
    var value: String
    var date: String
    
    init(cnpj: String, enterpriseName: String, value: String, date: String) {
        self.cnpj = cnpj
        self.enterpriseName = enterpriseName
        self.value = value
        self.date = date
    }
}

protocol NewNoteDelegate: class {
    func loading(_ show: Bool)
}

class NewNoteViewController: UIViewController {
    
    @IBOutlet weak var noteCNPJTf: UITextField!
    @IBOutlet weak var enterpriseNameTf: UITextField!
    @IBOutlet weak var noteValueTf: UITextField!
    @IBOutlet weak var noteDateTf: UITextField!
    
    var viewModel: NewNoteViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Nova nota"
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
