//
//  EnterpriseService.swift
//  MinhaEmpresa
//
//  Created by Chrystian on 26/10/20.
//  Copyright © 2020 Chrystian Salgado. All rights reserved.
//

import Foundation

protocol EnterpriseServiceProvider: class {
    func getEnterprise(cnpj: String, completion: @escaping (Result<Enterprise, NetworkError>)->Void)
}

class EnterpriseService: ServiceProvider, EnterpriseServiceProvider {
    
    func getEnterprise(cnpj: String, completion: @escaping (Result<Enterprise, NetworkError>)->Void) {
            request(target: EnterpriseAPI.getEnterprise(cnpj: cnpj), completion: completion)
    }
}
