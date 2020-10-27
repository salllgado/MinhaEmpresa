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
        let service = EnterpriseService()
        service.getEnterprise(cnpj: tfValue.normalizeValue()) { (result) in
            DispatchQueue.main.async {
                self.isLoading = false
                
                switch result {
                case .success(let enterprise):
                    if let _ = enterprise.message {
                        self.showingAlert = true
                        self.alertMessage = .parseError
                    } else {
                        self.userEnterprise = enterprise
                        self.navigate()
                    }
                case .failure(let error):
                    print(error)
                    self.showingAlert = true
                    self.alertMessage = LocalizedError.networkError
                }
            }
        }
    }
}

extension MainViewModel {
    
    func navigate() {
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

extension MainViewModel: HomeViewModelDelegate {
    
    func toogleNavigate() {
        self.isPresentingAddModal.toggle()
    }
}
