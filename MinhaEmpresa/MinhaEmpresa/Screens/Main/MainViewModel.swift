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
            Manager.requestEnterprise(cnpj: tfValue) { (enterprise, error) in
                if let _enterprise = enterprise {
                    self.userEnterprise = _enterprise
                    self.saveData(value: _enterprise)
                    self.saveData(value: self.tfValue)
                    self.navigate()
                } else {
                    print(error?.localizedDescription)
                }
            }
        }
    }
    
    func saveData(value: Any) {
        Manager.saveDataOnStorage(value: value)
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
    
    func logout() {
        Manager.deleteDataOnStorage(kind: .enterprise)
        self.navigate()
    }
    
    private func navigate() {
        self.isPresentingAddModal.toggle()
    }
}
