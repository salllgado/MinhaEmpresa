//
//  Feature.swift
//  Feature
//
//  Created by Chrystian Salgado on 24/07/19.
//  Copyright © 2019 Salgado's Production. All rights reserved.
//

import UIKit
import Firebase

public class Feature {
    
    init() {
        // ...
    }
    
    public class func registerNote(_ param: ResgistratioNoteParams) -> CoordinatorProtocol {
        let registerNoteCoordinator = ResgisterNoteCoordinator(presenter: param.presenter)
        return registerNoteCoordinator
    }
}

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
