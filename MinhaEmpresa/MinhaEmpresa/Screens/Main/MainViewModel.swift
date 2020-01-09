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
    
    func requestEnterprise(cnpj: String) {
        
    }
}
