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
    
    func fetchFavorites() -> [Favorite] {
        return PersistenceManager().fetchFavorites()
    }
}
