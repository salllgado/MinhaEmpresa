//
//  MainViewModel.swift
//  MinhaEmpresa
//
//  Created by Chrystian Salgado on 08/01/20.
//  Copyright © 2020 Chrystian Salgado. All rights reserved.
//

import Foundation
import Combine

class MainViewModel: ObservableObject, Identifiable {
    
    @Published var tfValue: String = ""
    @Published var isPresentingAddModal: Bool = false
    
    private (set) var userEnterprise: Enterprise?
    
    func requestEnterprise() {
        // verify for data in user defaults
        if let _enterprise = getEnterpriseData() {
            self.userEnterprise = _enterprise
            self.navigate()
        } else {
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
    }
    
    func getEnterpriseData() -> Enterprise? {
        return Manager.getDataOnStorage(kind: UserDefaultsKeys.enterprise) as? Enterprise
    }
    
    func getUserCNPJ() {
        if let _enterprise = getEnterpriseData() {
            self.userEnterprise = _enterprise
            navigate()
        }
    }
    
    func favorite() {
        guard let _cnpj = userEnterprise?.cnpj, let _nickname = userEnterprise?.nickname else { return }
        let dict: [String: String] = [
            "CNPJ": _cnpj,
            "name": _nickname
        ]
        
        var array = UserDefaults.standard.object(forKey: "favoriteEnterprises") as? [[String: String]] ?? [[String: String]]()
        array.append(dict)
        UserDefaults.standard.set(array, forKey: "favoriteEnterprises")
    }
    
    func logout() {
        Manager.deleteDataOnStorage(kind: .enterprise)
        self.navigate()
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
}
