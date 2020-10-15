//
//  MainViewModel.swift
//  MinhaEmpresa
//
//  Created by Chrystian Salgado on 08/01/20.
//  Copyright © 2020 Chrystian Salgado. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

struct FavoriteCNPJ: Identifiable {
    var id: UUID
    let cnpj: String
    let enterpriseName: String
    
    init(cnpj: String, enterpriseName: String) {
        self.id = UUID()
        self.cnpj = cnpj
        self.enterpriseName = enterpriseName
    }
}

class MainViewModel: ViewModable {
    
    @Published var tfValue: String = ""
    @Published var isPresentingAddModal: Bool = false
    @Published var isLoading: Bool = false
    @Published var favorites: Bool = false
    @Published var showingAlert: Bool = false
    
    private (set) var userEnterprise: Enterprise?
    private (set) var alertMessage: LocalizedError?
    
    func requestEnterprise() {
        self.isLoading = true
        Manager.requestEnterprise(cnpj: tfValue.normalizeValue()) { (enterprise, error) in
            self.isLoading = false
            if let _enterprise = enterprise {
                self.userEnterprise = _enterprise
                self.navigate()
            } else if let _enterprise = enterprise, let _ = _enterprise.message {
                self.showingAlert = true
                self.alertMessage = .parseError
            } else if let _ = error?.localizedDescription {
                self.showingAlert = true
                self.alertMessage = LocalizedError.networkError
            }
        }
    }
    
    func logout() {
        navigate()
    }
    
    func saveOnFavorites() {
        if let _userEnterprise = userEnterprise {
            let manager = PersistenceManager()
            manager.saveFavoriteIfNeeded(Favorite(cnpj: _userEnterprise.cnpj, name: _userEnterprise.enterpriseName))
        } else {
            alertMessage = LocalizedError.parseError
        }
    }
}

extension MainViewModel {
    
    fileprivate func navigate() {
        self.isPresentingAddModal.toggle()
    }
    
    fileprivate func addToShortcut(value: String) {
        RegisteredItems.newCNPJ.registerNewItem(cnpj: value)
    }
    
    fileprivate func excludeIfNeededCNPJ(_ cnpj: String) -> [FavoriteCNPJ] {
        let array = UserDefaults.standard.object(forKey: "favoriteEnterprises") as? [FavoriteCNPJ] ?? [FavoriteCNPJ]()
        
        return array.filter { (dict) -> Bool in
            dict.cnpj != cnpj
        }
    }
}
