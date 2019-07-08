//
//  NetworkAPI.swift
//  MinhaEmpresa
//
//  Created by Chrystian Salgado on 06/07/19.
//  Copyright © 2019 Salgado's Production. All rights reserved.
//

import Foundation
import Alamofire

struct EmptyRequest: Encodable {
    // ...
}

protocol NetworkAPIProtocol {
    func requestEnterprise(urlParam: String, completionHanlder: @escaping (_ response: Enterprise?, _ err: Error?)->Void)
}

class NetworkAPI: NetworkAPIProtocol {
    
    func requestEnterprise(urlParam: String, completionHanlder: @escaping (_ response: Enterprise?, _ err: Error?)->Void) {
        Manager().request(send: EmptyRequest(), on: SendRequest.none, in: Endpoint.enterpriseData(param: urlParam).path, httpMethod: HTTPMethod.get, response: Enterprise()) { (res, error) in
            completionHanlder(res, error)
        }
    }
}
