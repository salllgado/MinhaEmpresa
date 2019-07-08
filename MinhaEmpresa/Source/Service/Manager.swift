//
//  Manager.swift
//  MinhaEmpresa
//
//  Created by Chrystian Salgado on 06/07/19.
//  Copyright © 2019 Salgado's Production. All rights reserved.
//

import Foundation

enum SendRequest {
    case body
    case url
    case header
}

class Manager {
    
    func request(send param: Encodable, on type: SendRequest, in endpont: Endpoint) {
        // ...
    }
}
