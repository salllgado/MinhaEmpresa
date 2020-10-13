//
//  FavoriteList.swift
//  MinhaEmpresa
//
//  Created by Chrystian on 24/05/20.
//  Copyright © 2020 Chrystian Salgado. All rights reserved.
//

import SwiftUI

struct FavoriteList: View {
    
    @ObservedObject var viewModel = FavoriteListViewModel()
    
    var body: some View {
        VStack {
            List {
                ForEach(viewModel.fetchFavorites()) { favorite in
                    Text(favorite.cnpj)
                }
            }
        }
        .navigationBarTitle(
            Text("Some").foregroundColor(Color.primaryColor),
            displayMode: .inline
        )
    }
}

struct FavoriteList_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteList(viewModel: FavoriteListViewModel())
    }
}
