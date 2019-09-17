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
    func serverResponds()
}

class NewNoteViewModel {
    
    weak var delegate: NewNoteDelegate?
    weak var viewControllerDelegate: NewNoteViewControllerDelegate?
    private (set) var lastId: Int
    private (set) var enterpriseData: Enterprise?
    
    private let worker: CoreDataWorkable?
    
    init(lastReceipt id: Int) {
        self.lastId = id
        self.worker = CoreDataWorker()
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
    
    func loadData(cnpj: String) {
        delegate?.loading(true)
        Manager.requestEnterprise(cnpj: cnpj) { (response, error) in
            self.delegate?.loading(false)
            if let err = error {
                Logger.log(err)
            } else if let enterprise = response {
                self.enterpriseData = enterprise
                self.delegate?.loading(false)
                self.delegate?.serverResponds()
            }
        }
    }
    
    private func validReceipt(_ receipt: Receipt) -> Bool {
        return !(receipt.cnpj == "")
    }
    
    private func saveReceipt(_ receipt: Receipt) {
        do {
            try worker?.create(receipt)
        } catch {
            // ...
        }
    }
}
