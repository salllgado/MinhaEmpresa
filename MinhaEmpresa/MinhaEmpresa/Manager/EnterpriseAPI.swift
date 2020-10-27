//
//  EnterpriseAPI.swift
//  MinhaEmpresa
//
//  Created by Chrystian on 26/10/20.
//  Copyright © 2020 Chrystian Salgado. All rights reserved.
//

import Foundation

enum EnterpriseAPI {
    case getEnterprise(cnpj: String)
}

extension EnterpriseAPI: ServiceTargetProtocol {
    
    var baseURL: URL? {
        let host = Bundle.main.infoDictionary?["BaseUrl"] as? String ?? ""
        let httpProtocol = Bundle.main.infoDictionary?["HttpProtocol"] as? String ?? ""
        return URL(string: "\(httpProtocol)://\(host)")
    }
    
    var path: String {
        switch self {
        case .getEnterprise(let cnpj):
            return "/v1/cnpj/\(cnpj)"
        }
    }
    
    var method: HTTPMethod {
        return .GET
    }
    
    var parameters: [String : String] {
        return [:]
    }
    
}
