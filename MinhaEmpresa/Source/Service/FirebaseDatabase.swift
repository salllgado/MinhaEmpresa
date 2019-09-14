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
    
    func saveData(path: String?, dict: [String: Any]) {
        let ref = self.getReference()
        
        if let _path = path {
            ref.child(_path).setValue(dict)
        } else {
            ref.setValue(dict)
        }
    }
    
    func getData<T: Decodable>(decodableObj: T.Type, completion: @escaping(_ responseObj: T?, _ error: Error?) -> Void) {
        let ref = getReference()
        
        ref.observeSingleEvent(of: .value) { (firebaseData) in
            guard let value = firebaseData.value as? [String: Any] else {
                Logger.log("Data is not available")
                completion(nil, nil)
                return
            }
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: value, options: [])
                let decodableValue = try JSONDecoder().decode(decodableObj, from: jsonData)
                completion(decodableValue, nil)
            } catch let error {
                Logger.log(error.localizedDescription)
                completion(nil, error)
            }
        }
        
    }
}
