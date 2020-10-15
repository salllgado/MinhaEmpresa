//
//  Manager.swift
//  NetworkKit
//
//  Created by Chrystian Salgado on 04/08/19.
//  Copyright © 2019 Salgado's Production. All rights reserved.
//

import Foundation

class Manager {
    
    class func requestEnterprise(cnpj: String, completionHandler: @escaping (_ response: Enterprise?, _ error: Error?)-> Void) {
        Network.sharedInstance.request(
            send: EmptyRequest(),
            on: SendRequest.none,
            in: Endpoint.enterpriseData(param: cnpj),
            httpMethod: HTTPMethod.get, response: Enterprise(),
            completionHandler: completionHandler)
    }
}
