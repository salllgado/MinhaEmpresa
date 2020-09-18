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
    @Published var isLoading: Bool = true
    @Published var favorites: Bool = false
    
    private (set) var userEnterprise: Enterprise?
    
    func requestEnterprise() {
        self.isLoading = true
        Manager.requestEnterprise(cnpj: tfValue.normalizeValue()) { (enterprise, error) in
            self.isLoading = false
            if let _enterprise = enterprise {
                self.userEnterprise = _enterprise
                self.saveData(value: _enterprise)
                self.saveData(value: self.tfValue)
                self.addToShortcut(value: _enterprise.cnpj)
                self.navigate()
            } else if let err = error?.localizedDescription {
                print(err)
            }
        }
    }
    
    func getLastFavoriteCNPJ(){
        let dictArray = UserDefaults.standard.object(forKey: "favoriteEnterprises") as? [[String: String]]
        tfValue = dictArray?.last?["CNPJ"] ?? ""
    }
    
    func favorite() {        
        guard let _cnpj = userEnterprise?.cnpj, let _nickname = userEnterprise?.nickname else { return }
        PersistenceManager().saveFavorite(Favorite(cnpj: _cnpj, name: _nickname))
    }
    
    func fetchFavorites() -> [FavoriteCNPJ] {
        let array = UserDefaults.standard.object(forKey: "favoriteEnterprises") as? [FavoriteCNPJ] ?? [FavoriteCNPJ]()
        favorites = !array.isEmpty
        return array
    }
    
    func logout() {
        Manager.deleteDataOnStorage(kind: .enterprise)
        navigate()
    }
    
}

extension MainViewModel {
    
    fileprivate func navigate() {
        self.isPresentingAddModal.toggle()
    }
    
    fileprivate func addToShortcut(value: String) {
        RegisteredItems.newCNPJ.registerNewItem(cnpj: value)
    }
    
    fileprivate func saveData(value: Any) {
        Manager.saveDataOnStorage(value: value)
    }
    
    fileprivate func excludeIfNeededCNPJ(_ cnpj: String) -> [FavoriteCNPJ] {
        let array = UserDefaults.standard.object(forKey: "favoriteEnterprises") as? [FavoriteCNPJ] ?? [FavoriteCNPJ]()
        
        return array.filter { (dict) -> Bool in
            dict.cnpj != cnpj
        }
    }
}
