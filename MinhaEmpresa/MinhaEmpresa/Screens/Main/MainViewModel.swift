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

class MainViewModel: ObservableObject, Identifiable {
    
    @Published var tfValue: String = ""
    @Published var isPresentingAddModal: Bool = false
    @Published var favorites: Bool = false
    
    private (set) var userEnterprise: Enterprise?
    
    func requestEnterprise() {
        Manager.requestEnterprise(cnpj: tfValue.normalizeValue()) { (enterprise, error) in
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
        let dict: [String: String] = [
            "CNPJ": _cnpj,
            "name": _nickname
        ]
        
        var array = excludeIfNeededCNPJ(_cnpj)
        array.append(dict)
        UserDefaults.standard.set(array, forKey: "favoriteEnterprises")
    }
    
    func fetchFavorites() {
        let array = UserDefaults.standard.object(forKey: "favoriteEnterprises") as? [[String: String]] ?? [[String: String]]()
        favorites = !array.isEmpty
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
    
    fileprivate func excludeIfNeededCNPJ(_ cnpj: String) -> [[String: String]] {
        let array = UserDefaults.standard.object(forKey: "favoriteEnterprises") as? [[String: String]] ?? [[String: String]]()
        
        return array.filter { (dict) -> Bool in
            dict["CNPJ"] != cnpj
        }
    }
}
