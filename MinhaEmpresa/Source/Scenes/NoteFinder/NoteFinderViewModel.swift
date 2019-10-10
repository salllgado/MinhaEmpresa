//
//  NoteFinderViewModel.swift
//  MinhaEmpresa
//
//  Created by Chrystian Salgado on 01/10/19.
//  Copyright © 2019 Salgado's Production. All rights reserved.
//

import Foundation
import NetworkKit

class NoteFinderViewModel {
    
    private (set) var enterpriseData: Enterprise?
    private (set) var favoritedEnterprises: [Enterprise] = []
    private var network: NetworkWorkable? = NetworkWorker()
    
    weak var delegate: NoteFinderViewModelDelegate?
    
    func requestEnterpriseData(cnpj: String) {
        delegate?.loading(true)
        network?.requestEnterprise(cnpj: cnpj, completionHandler: { (response, error) in
            self.delegate?.loading(false)
            if let err = error {
                Logger.log(err)
            } else if let enterprise = response {
                self.verifyEnterprise(cnpj: enterprise.cnpj)
                self.favoritedEnterprises.append(enterprise)
                self.delegate?.loading(false)
                self.delegate?.serverResponds()
            }
        })
    }
    
    private func verifyEnterprise(cnpj: String) {
        favoritedEnterprises = favoritedEnterprises.filter({ $0.cnpj != cnpj })
    }
    
    func sendSelectedEnterprise(_ enterprise: Enterprise) {
        let dict = ["value": enterprise]
        NotificationCenter.default.post(name: NSNotification.Name(NotificationName.Action.enterpriseSelected.rawValue), object: nil, userInfo: dict)
    }
}

struct NotificationName {
    
    enum Action: String {
        case enterpriseSelected = "enterpriseSelected"
    }
}

