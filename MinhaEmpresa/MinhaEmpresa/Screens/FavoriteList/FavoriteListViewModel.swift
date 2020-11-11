//
//  FavoriteListViewModel.swift
//  MinhaEmpresa
//
//  Created by Chrystian on 29/06/20.
//  Copyright © 2020 Chrystian Salgado. All rights reserved.
//

import Foundation
import Combine

protocol ViewModable: ObservableObject, Identifiable {}

class FavoriteListViewModel: ViewModable {
    
    @Published var favorites: [Favorite] = []
    
    func fetchFavorites() {
        favorites = PersistenceManager().fetchFavorites()
    }
    
    func deleteFavorite(at offset: IndexSet) {
        for index in offset {
            let favorite = PersistenceManager().fetchFavorites()[index]
            PersistenceManager().deleteFavoriteIfNeeded(favorite, completion: { success in
                if success {
                    self.favorites = PersistenceManager().fetchFavorites()
                }
            })
        }
    }
    
    func fetchEnterprise(completion: @escaping ()->()) {
        
    }
}
