//
//  KeychainService.swift
//  MinhaEmpresa
//
//  Created by Chrystian Salgado on 20/07/19.
//  Copyright © 2019 Salgado's Production. All rights reserved.
//

import Foundation
import KeychainSwift
import NetworkKit

internal let cnpjKey: String = "keychain_enterprise_cnpj"

protocol KeychainWorkable {
    func getEnterpriseId() -> String
    func saveEnterpriseId(enterprise: Enterprise)
    func deleteEnterpriseId()
}

class KeychainWorker: KeychainWorkable {
    
    private var keychainAcess: KeychainSwift
    
    public init() {
        self.keychainAcess = KeychainSwift()
    }
    
    public func getEnterpriseId() -> String {
        return keychainAcess.get(cnpjKey) ?? ""
    }
    
    public func saveEnterpriseId(enterprise: Enterprise) {
        keychainAcess.set(enterprise.cnpj, forKey: cnpjKey)
    }
    
    public func deleteEnterpriseId() {
        keychainAcess.delete(cnpjKey)
    }
}

