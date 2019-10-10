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
    private let network: NetworkWorkable?
    
    init(lastReceipt id: Int) {
        self.lastId = id
        self.worker = CoreDataWorker()
        self.network = NetworkWorker()
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
        network?.requestEnterprise(cnpj: cnpj, completionHandler: { (response, error) in
            self.delegate?.loading(false)
            if let err = error {
                Logger.log(err)
            } else if let enterprise = response {
                self.enterpriseData = enterprise
                self.delegate?.loading(false)
                self.delegate?.serverResponds()
            }
        })
    }
    
    func addObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(updateEnterpriseData), name: NSNotification.Name(NotificationName.Action.enterpriseSelected.rawValue), object: nil)
    }
    
    func removeObservers() {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: NotificationName.Action.enterpriseSelected.rawValue), object: nil)
    }
    
    @objc private func updateEnterpriseData(notification: NSNotification) {
        if let enterprise = notification.userInfo?["value"] as? Enterprise {
            Logger.log(enterprise)
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
