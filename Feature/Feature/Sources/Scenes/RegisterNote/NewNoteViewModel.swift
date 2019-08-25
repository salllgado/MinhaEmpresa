//
//  NewNoteViewModel.swift
//  Feature
//
//  Created by Chrystian Salgado on 18/08/19.
//  Copyright © 2019 Salgado's Production. All rights reserved.
//

import Foundation
import NetworkKit

class NewNoteViewModel {
    
    weak var delegate: NewNoteDelegate?
    
    func saveData(_ receipt: Receipt) {
        delegate?.loading(true)
        // perfrom save
        delegate?.loading(false)
    }
}
