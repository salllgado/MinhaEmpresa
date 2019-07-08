//
//  MainViewModel.swift
//  MinhaEmpresa
//
//  Created by Chrystian Salgado on 08/07/19.
//  Copyright © 2019 Salgado's Production. All rights reserved.
//

import Foundation

protocol MainViewModelDelegate: class {
    // ...
}

class MainViewModel {
    
    weak var delegate: MainViewModelDelegate?
    private var network: NetworkAPIProtocol?
    
    init() {
        network = NetworkAPI()
    }
    
    func loadData(cnpj: String) {
        network?.requestEnterprise(urlParam: cnpj)
    }
}
