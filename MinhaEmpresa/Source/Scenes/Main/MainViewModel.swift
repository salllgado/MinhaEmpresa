//
//  MainViewModel.swift
//  MinhaEmpresa
//
//  Created by Chrystian Salgado on 08/07/19.
//  Copyright © 2019 Salgado's Production. All rights reserved.
//

import Foundation
import NetworkKit

protocol MainViewModelDelegate: class {
    func serverResponds(send: Enterprise)
    func setEnterpriseId(cnpj: String)
    func loadingStart()
    func loadingEnd()
}

class MainViewModel {
    
    weak var delegate: MainViewModelDelegate?
    private var keychain: KeychainWorkable?
    
    init() {
        keychain = KeychainWorker()
    }
    
    func loadData(cnpj: String) {
        delegate?.loadingStart()
        Manager.requestEnterprise(cnpj: cnpj) { (response, error) in
            if let err = error {
                Logger.log(err)
            } else if let enterprise = response {
                self.delegate?.serverResponds(send: enterprise)
            }
        }
    }
    
    func getEnterpriseId() {
        delegate?.setEnterpriseId(cnpj: keychain?.getEnterpriseId() ?? "")
    }
}
