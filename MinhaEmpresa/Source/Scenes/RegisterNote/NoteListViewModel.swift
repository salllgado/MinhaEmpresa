//
//  ResgisterNoteViewModel.swift
//  Feature
//
//  Created by Chrystian Salgado on 24/07/19.
//  Copyright © 2019 Salgado's Production. All rights reserved.
//

import Foundation
import FirebaseDatabase

protocol NoteListDelegate: class {
    func fetchNotesResponds()
    func loading(_ isLoading: Bool)
}

class NoteListViewModel {
    
    weak var delegate: NoteListDelegate?
    private (set) var notes: [Receipt] = []
    
    // Fetch notes in system.
    func fetchNotes() {
        loadDataFromFirebase()
    }
    
    func loadDataFromFirebase() {
        delegate?.loading(true)
        
        FirebaseDatabase.sharedInstance.getData(decodableObj: Receipts.self) { (response, err) in
            self.delegate?.loading(false)
            if let receipt = response {
                self.notes = receipt.CNPJ
                self.delegate?.fetchNotesResponds()
            } else {
                Logger.log(err?.localizedDescription)
            }
        }
    }
    
    func removeReceipt(receipt: Receipt) {
        for i in 0...notes.count - 1{
            if notes[i] == receipt {
                notes.remove(at: i)
                break
            }
        }
    }
}

extension Receipt: Equatable {
    static func ==(lhs: Receipt, rhs: Receipt) -> Bool {
        return lhs.value == rhs.value
    }
}

