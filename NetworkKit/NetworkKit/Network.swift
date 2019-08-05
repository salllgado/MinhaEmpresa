//
//  Network.swift
//  NetworkKit
//
//  Created by Chrystian Salgado on 04/08/19.
//  Copyright © 2019 Salgado's Production. All rights reserved.
//

import Foundation

enum SendRequest {
    case body
    case header
    case none
}

enum HTTPMethod {
    case get
    case post
}

class Network {
    
    static let sharedInstance = Network()
    
    func request<T: Encodable, U: Decodable>(send param: T?, on type: SendRequest, in endpoint: Endpoint, httpMethod: HTTPMethod, response: U, completionHandler: @escaping (_ response: U?, _ error: Error?)-> Void) {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = httpProtocol
        urlComponents.host = host
        urlComponents.path = endpoint.path
        
        guard let _url = urlComponents.url else { return }
        let urlRequest = URLRequest(url: _url)
        
        URLSession.shared.dataTask(with: urlRequest) { (data, request, error) in
            DispatchQueue.main.async {
                if let _err = error {
                    completionHandler(nil, _err)
                } else if let _data = data {
                    print(_data.prettyPrintedJSONString)
                    self.parseObj(responseObj: response, data: _data, completionHandler: completionHandler)
                }
            }
        }.resume()
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

extension Data {
    var prettyPrintedJSONString: NSString? { /// NSString gives us a nice sanitized debugDescription
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
            let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
            let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { return nil }
        
        return prettyPrintedString
    }
}

