//
//  NetworkWorker.swift
//  MinhaEmpresa
//
//  Created by Chrystian Salgado on 17/09/19.
//  Copyright © 2019 Salgado's Production. All rights reserved.
//

import Foundation

protocol NetworkWorkable {
    func requestEnterprise(cnpj: String, completionHandler: @escaping (_ response: Enterprise?, _ error: Error?)-> Void)
}

class NetworkWorker: NetworkWorkable {
    
    /// Request for Enterprise data.
    func requestEnterprise(cnpj: String, completionHandler: @escaping (_ response: Enterprise?, _ error: Error?)-> Void) {
        Manager.requestEnterprise(cnpj: cnpj, completionHandler: completionHandler)
    }
}
