//
//  ResgisterNoteViewModel.swift
//  Feature
//
//  Created by Chrystian Salgado on 24/07/19.
//  Copyright © 2019 Salgado's Production. All rights reserved.
//

import Foundation
import FirebaseDatabase

struct Notes {
    var enterpriseName: String
    var enterpriseCNPJ: String
    var noteValue: Double
    var noteDate: Date
}

protocol RegisterNoteDelegate: class {
    func fetchNotesResponds()
}

class ResgisterNoteViewModel {
    
    weak var delegate: RegisterNoteDelegate?
    private (set) var notes: [Receipt] = []
    
    // Fetch notes in system.
    func fetchNotes() {
        loadDataFromFirebase()
    }
    
    func loadDataFromFirebase() {
        let ref = FirebaseDatabase.sharedInstance.getReference()
        ref.observeSingleEvent(of: .value) { (firebaseData) in
            guard let value = firebaseData.value as? [String: Any] else { return }
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: value, options: [])
                let receipt = try JSONDecoder().decode(Receipts.self, from: jsonData)
                
                self.notes = [receipt.CNPJ]
            } catch let error {
                print(error)
            }
            self.delegate?.fetchNotesResponds()
        }
    }
}
