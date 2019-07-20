//
//  HomeViewModel.swift
//  MinhaEmpresa
//
//  Created by Chrystian Salgado on 20/07/19.
//  Copyright © 2019 Salgado's Production. All rights reserved.
//

import Foundation

class HomeViewModel {
    
    private var keychain: KeychainWorkable?
    var enterprise: Enterprise? {
        didSet {
            keychain = KeychainWorker()
        }
    }
    
    // Save cnpj in keychain
    func saveEnterpriseIdentification() {
        guard let _enterprise = enterprise else { return }
        keychain?.saveEnterpriseId(enterprise: _enterprise)
    }
}
