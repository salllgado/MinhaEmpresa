//
//  Favorite.swift
//  MinhaEmpresa
//
//  Created by Chrystian on 02/07/20.
//  Copyright © 2020 Chrystian Salgado. All rights reserved.
//

import Foundation
import CoreData

struct Favorite: Identifiable {
    let id: UUID
    let cnpj: String
    let name: String
    let managedObject: NSManagedObject?
    
    init(id: UUID = UUID(), cnpj: String, name: String, managedObject: NSManagedObject? = nil) {
        self.id = id
        self.cnpj = cnpj
        self.name = name
        self.managedObject = managedObject
    }
}

extension Favorite {
    
    enum PersistenceKey: String {
        case cnpj
        case name
        case id
    }
}
