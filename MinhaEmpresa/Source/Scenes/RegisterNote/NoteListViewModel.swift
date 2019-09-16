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
    
    private let coreDataWorker: CoreDataWorkable?
    
    init() {
        coreDataWorker = CoreDataWorker()
    }
    
    // Fetch notes in system.
    func fetchNotes() {
        loadDataFromFirebase()
    }
    
    func loadDataFromFirebase() {
        delegate?.loading(true)
        
        do {
            let values = try coreDataWorker?.fetch()
            self.notes = values ?? []
        } catch {
            // ...
        }
        
        self.delegate?.loading(false)
        self.delegate?.fetchNotesResponds()
    }
    
    func removeReceipt(receipt: Receipt) {
        do {
            try coreDataWorker?.delete(receipt)
            for i in 0...notes.count - 1{
                if notes[i] == receipt {
                    notes.remove(at: i)
                    break
                }
            }
        } catch {
            // ...
        }
    }
}
