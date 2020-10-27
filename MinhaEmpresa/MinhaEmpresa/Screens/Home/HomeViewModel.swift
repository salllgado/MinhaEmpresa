//
//  HomeViewModel.swift
//  MinhaEmpresa
//
//  Created by Chrystian on 26/10/20.
//  Copyright © 2020 Chrystian Salgado. All rights reserved.
//

import Foundation

protocol HomeViewModelDelegate: class {
    func toogleNavigate()
}

class HomeViewModel: ViewModable {
    
    @Published var isPresentingAddModal: Bool = false
    
    weak private (set) var delegate: HomeViewModelDelegate?
    private (set) var userEnterprise: Enterprise?
    
    init(enterprise: Enterprise, delegate: HomeViewModelDelegate?) {
        self.userEnterprise = enterprise
        self.delegate = delegate
    }

    func logout() {
        navigate()
    }
    
    func saveOnFavorites() {
        if let _userEnterprise = userEnterprise {
            let manager = PersistenceManager()
            manager.saveFavoriteIfNeeded(Favorite(cnpj: _userEnterprise.cnpj, name: _userEnterprise.enterpriseName))
        } else {
//            alertMessage = LocalizedError.parseError
        }
    }
}


extension HomeViewModel {
    fileprivate func navigate() {
        self.delegate?.toogleNavigate()
    }
    
}
