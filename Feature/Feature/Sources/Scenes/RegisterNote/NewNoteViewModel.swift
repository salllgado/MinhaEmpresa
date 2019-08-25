//
//  NewNoteViewModel.swift
//  Feature
//
//  Created by Chrystian Salgado on 18/08/19.
//  Copyright © 2019 Salgado's Production. All rights reserved.
//

import Foundation
import NetworkKit

protocol NewNoteDelegate: class {
    func loading(_ show: Bool)
}

class NewNoteViewModel {
    
    weak var delegate: NewNoteDelegate?
    weak var viewControllerDelegate: NewNoteViewControllerDelegate?
    
    func saveData(_ receipt: Receipt) {
        delegate?.loading(true)
        // perfrom save
        delegate?.loading(false)
        viewControllerDelegate?.navigate()
    }
}
