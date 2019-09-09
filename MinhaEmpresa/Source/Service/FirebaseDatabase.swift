//
//  FirebaseDatabase.swift
//  MinhaEmpresa
//
//  Created by Chrystian Salgado on 07/09/19.
//  Copyright © 2019 Salgado's Production. All rights reserved.
//

import Foundation
import Firebase

class FirebaseDatabase {
    
    static let sharedInstance = FirebaseDatabase()
    private var ref: DatabaseReference
    
    init() {
        FirebaseApp.configure()
        ref = Database.database().reference()
    }
    
    func getReference() -> DatabaseReference {
        return ref
    }
}
