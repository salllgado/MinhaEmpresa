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
}

class NewNoteViewModel {
    
    weak var delegate: NewNoteDelegate?
    weak var viewControllerDelegate: NewNoteViewControllerDelegate?
    private (set) var lastId: Int
    
    init(lastReceipt id: Int) {
        self.lastId = id
    }
    
    func saveData(_ receipt: Receipt) {
        delegate?.loading(true)
        saveReceipt(receipt)
        delegate?.loading(false)
        viewControllerDelegate?.navigate()
    }
    
    private func saveReceipt(_ receipt: Receipt) {
        let dictValue = try? receipt.toDict()
        let ref = FirebaseDatabase.sharedInstance.getReference()
        ref.child("CNPJ/\(self.lastId)").setValue(dictValue)
    }
}

fileprivate extension Encodable {
    
    func toDict() throws -> [String: String]? {
        do {
            let jsonData = try JSONEncoder().encode(self)
            let dict = try JSONSerialization.jsonObject(with: jsonData)
            if let dictionary = dict as? [String: String] {
                return dictionary
            }
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
}
