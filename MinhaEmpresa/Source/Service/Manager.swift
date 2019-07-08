//
//  Manager.swift
//  MinhaEmpresa
//
//  Created by Chrystian Salgado on 06/07/19.
//  Copyright © 2019 Salgado's Production. All rights reserved.
//

import Foundation
import Alamofire

enum SendRequest {
    case body
    case header
    case none
}

class Manager {
    
    func request<T: Encodable, U: Decodable>(send param: T?, on type: SendRequest, in endpont: String, httpMethod: HTTPMethod, response: U, completionHandler: @escaping (_ response: U?, _ error: Error?)-> Void) {
        
        var bodyParams: [String: String]? = nil
        var headerParams: [String: String]? = nil
        
        var urlComponents = URLComponents()
        urlComponents.scheme = httpProtocol
        urlComponents.host = host
        urlComponents.path = endpont
        
        do {
            
            switch type {
            case .body:
                bodyParams = try param.toDict()
            case .header:
                headerParams = try param.toDict()
            case .none:
                break
            }

            Alamofire.request(urlComponents, method: httpMethod, parameters: bodyParams, encoding: JSONEncoding.default, headers: headerParams).responseData { (responseData) in
                if let data = responseData.data {
                    Logger().log(String(data: data, encoding: .utf8))
                    self.parseObj(responseObj: response, data: data, completionHandler: completionHandler)
                }
                else {
                    completionHandler(nil, responseData.error)
                }
            }
        } catch {
            completionHandler(nil, error)
        }
    }
    
    private func parseObj<U: Decodable>(responseObj: U, data: Data, completionHandler: @escaping (_ response: U?, _ error: Error?)-> Void) {
        do {
            let resonseObj = try JSONDecoder().decode(U.self, from: data)
            completionHandler(resonseObj, nil)
        } catch {
            completionHandler(nil, error)
        }
    }
}
