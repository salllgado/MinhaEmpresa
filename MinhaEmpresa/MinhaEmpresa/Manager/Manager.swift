//
//  Manager.swift
//  NetworkKit
//
//  Created by Chrystian Salgado on 04/08/19.
//  Copyright © 2019 Salgado's Production. All rights reserved.
//

import Foundation


enum UserDefaultsKeys: String {
    case enterprise = "userEnterpriseValue"
    case userCNPJ = "userCNPJValue"
}

class Manager {
    
    init() {
        // ...
    }
    
    class func requestEnterprise(cnpj: String, completionHandler: @escaping (_ response: Enterprise?, _ error: Error?)-> Void) {
        Network.sharedInstance.request(
            send: EmptyRequest(),
            on: SendRequest.none,
            in: Endpoint.enterpriseData(param: cnpj),
            httpMethod: HTTPMethod.get, response: Enterprise(),
            completionHandler: completionHandler)
    }
    
    class func saveDataOnStorage(value: Any) {
        if let _value = value as? Enterprise {
            try? _value.save()
        } else if let _cnpj = value as? String {
            UserDefaults.standard.set(_cnpj, forKey: UserDefaultsKeys.userCNPJ.rawValue)
        }
    }
    
    class func getDataOnStorage(kind: UserDefaultsKeys) -> Any? {
        switch kind {
        case .enterprise:
            return try? Enterprise().load()
        case .userCNPJ:
            return UserDefaults.standard.object(forKey: kind.rawValue)
        }
    }
}
