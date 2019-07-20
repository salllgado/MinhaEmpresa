//
//  MainViewModel.swift
//  MinhaEmpresa
//
//  Created by Chrystian Salgado on 08/07/19.
//  Copyright © 2019 Salgado's Production. All rights reserved.
//

import Foundation

protocol MainViewModelDelegate: class {
    func serverResponds(send: Enterprise)
    func setEnterpriseId(cnpj: String)
    func loadingStart()
    func loadingEnd()
}

class MainViewModel {
    
    weak var delegate: MainViewModelDelegate?
    private var network: NetworkAPIProtocol?
    private var keychain: KeychainWorkable?
    
    init() {
        network = NetworkAPI()
        keychain = KeychainWorker()
    }
    
    func loadData(cnpj: String) {
        delegate?.loadingStart()
        network?.requestEnterprise(urlParam: cnpj, completionHanlder: { (response, error) in
            self.delegate?.loadingEnd()
            if let err = error {
                Logger.log(err)
            } else if let enterprise = response {
                self.delegate?.serverResponds(send: enterprise)
            }
        })
    }
    
    func getEnterpriseId() {
        delegate?.setEnterpriseId(cnpj: keychain?.getEnterpriseId() ?? "")
    }
}
