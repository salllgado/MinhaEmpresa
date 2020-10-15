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
            if viewModel.fetchFavorites().isEmpty {
                Text("Não há favoritos")
                    .bold()
                    .font(.body)
                    .foregroundColor(.gray)
            } else {
                List {
                    ForEach(viewModel.fetchFavorites()) { favorite in
                        Text(favorite.cnpj)
                    }
                }
            }
        }
        .navigationBarTitle("Favoritos", displayMode: .inline)
    }
}

struct FavoriteList_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteList(viewModel: FavoriteListViewModel())
    }
}
