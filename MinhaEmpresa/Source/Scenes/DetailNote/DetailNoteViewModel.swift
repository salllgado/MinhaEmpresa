//
//  DetailNoteViewModel.swift
//  MinhaEmpresa
//
//  Created by Chrystian Salgado on 21/09/19.
//  Copyright © 2019 Salgado's Production. All rights reserved.
//

import Foundation

protocol DetailNoteDelegate: class {
    // ...
}

class DetailNoteViewModel: DetailNoteDelegate {
    
    let receipt: Receipt?
    
    init(receipt: Receipt) {
        self.receipt = receipt
    }
}
