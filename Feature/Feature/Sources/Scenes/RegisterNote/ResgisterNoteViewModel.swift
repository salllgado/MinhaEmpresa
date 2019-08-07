//
//  ResgisterNoteViewModel.swift
//  Feature
//
//  Created by Chrystian Salgado on 24/07/19.
//  Copyright © 2019 Salgado's Production. All rights reserved.
//

import Foundation

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
    private (set) var notes: [Notes] = []
    
    // Fetch notes in system.
    func fetchNotes() {
        notes = []
        delegate?.fetchNotesResponds()
    }
}
