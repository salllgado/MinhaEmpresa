//
//  Endpoint.swift
//  NetworkKit
//
//  Created by Chrystian Salgado on 04/08/19.
//  Copyright © 2019 Salgado's Production. All rights reserved.
//

import Foundation

/*
 https://stackoverflow.com/questions/3968919/how-can-i-access-a-user-defined-xcode-build-setting
 */
let host = Bundle.main.infoDictionary?["BaseUrl"] as? String ?? ""
let httpProtocol = Bundle.main.infoDictionary?["HttpProtocol"] as? String ?? ""

///Enum of available endpoints.
enum Endpoint{
    case enterpriseData(param: String)
}

extension Endpoint {
    var path: String {
        
        switch self {
        case .enterpriseData(let param):
            return "/v1/cnpj/\(param)"
        }
    }
}
