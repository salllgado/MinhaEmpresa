//
//  NewNoteViewModel.swift
//  Feature
//
//  Created by Chrystian Salgado on 18/08/19.
//  Copyright © 2019 Salgado's Production. All rights reserved.
//

import Foundation
import NetworkKit
import Firebase

protocol NewNoteDelegate: class {
    func loading(_ show: Bool)
    func showAlert(_ actions: [UIAlertAction])
}

class NewNoteViewModel {
    
    weak var delegate: NewNoteDelegate?
    weak var viewControllerDelegate: NewNoteViewControllerDelegate?
    private (set) var lastId: Int
    
    init(lastReceipt id: Int) {
        self.lastId = id
    }
    
    func saveData(_ receipt: Receipt) {
        if validReceipt(receipt) {
            saveReceipt(receipt)
            viewControllerDelegate?.navigate()
        } else {
            print("Show alert to user because this note needs cnpj.")
            
            let action = UIAlertAction(title: "CANCELAR", style: .cancel, handler: nil)
            delegate?.showAlert([action])
        }
    }
    
    private func validReceipt(_ receipt: Receipt) -> Bool {
        return !(receipt.cnpj == "")
    }
    
    private func saveReceipt(_ receipt: Receipt) {
        guard let dictValue = try? receipt.toDict() else { return }
        FirebaseDatabase.sharedInstance.saveData(path: "CNPJ/\(self.lastId)", dict: dictValue)
    }
}
