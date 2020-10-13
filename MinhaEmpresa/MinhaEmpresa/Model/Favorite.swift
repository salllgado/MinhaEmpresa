//
//  Favorite.swift
//  MinhaEmpresa
//
//  Created by Chrystian on 02/07/20.
//  Copyright © 2020 Chrystian Salgado. All rights reserved.
//

import Foundation

struct Favorite: Identifiable {
    let id: UUID
    let cnpj: String
    let name: String
    
    init(cnpj: String, name: String) {
        self.id = UUID()
        self.cnpj = cnpj
        self.name = name
    }
}

extension Favorite {
    
    enum PersistenceKey: String {
        case cnpj
        case name
    }
}
