//
//  FavoriteList.swift
//  MinhaEmpresa
//
//  Created by Chrystian on 24/05/20.
//  Copyright © 2020 Chrystian Salgado. All rights reserved.
//

import SwiftUI

struct FavoriteList: View {
    
    @ObservedObject var viewModel:  FavoriteListViewModel
    
    var body: some View {
        VStack {
            if viewModel.favorites.isEmpty {
                Text("Não há favoritos")
                    .bold()
                    .font(.body)
                    .foregroundColor(.gray)
            } else {
                List {
                    ForEach(viewModel.favorites) { favorite in
                        NavigationLink(destination: HomeContentView(vm: HomeViewModel(enterprise: Enterprise(cnpj: favorite.cnpj), delegate: nil)), label: {
                            VStack(alignment: .leading) {
                                Text(favorite.name)
                                    .font(Font.system(size: 18, weight: .bold))
                                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 4, trailing: 0))
                                Text(favorite.cnpj)
                            }
                            .padding(EdgeInsets(top: 0, leading: 8, bottom: 4, trailing: 8))
                        })
                    }.onDelete(perform: viewModel.deleteFavorite)
                }
            }
        }
        .onAppear {
            viewModel.fetchFavorites()
        }
        .navigationBarTitle("Favoritos", displayMode: .inline)
    }
    
    init(viewModel: FavoriteListViewModel = FavoriteListViewModel()) {
        self.viewModel = viewModel
    }
}

struct FavoriteList_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteList(viewModel: FavoriteListViewModel())
    }
}
