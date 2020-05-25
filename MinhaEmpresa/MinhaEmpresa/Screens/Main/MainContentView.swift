//
//  MainContentView.swift
//  MinhaEmpresa
//
//  Created by Chrystian Salgado on 08/01/20.
//  Copyright © 2020 Chrystian Salgado. All rights reserved.
//

import SwiftUI

struct MainContentView: View {
    
    @ObservedObject var viewModel = MainViewModel()
    
    @State var isPresentingAddModal: Bool = false
    
    init() {
        withAnimation(.spring()){
            self.viewModel.getLastFavoriteCNPJ()
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                    .frame(width: 200, height: 400, alignment: .center)
                VStack(alignment: .leading) {
                    Text(Locale.mainSubtitle.value)
                        .font(Font.system(size: 28, weight: .bold))
                        .foregroundColor(Color.textSecondary)
                    CustomTextField(title: Locale.mainTextFieldPlaceholder.value, value: $viewModel.tfValue)
                        .padding(EdgeInsets(
                            top: 0,
                            leading: 0,
                            bottom: 80,
                            trailing: 0))
                    Spacer()
                    if viewModel.favorites {
                        NavigationLink(destination: FavoriteList(), label: {
                            ButtonStyle(text: "Favoritos")
                                .background(Color.black)
                                .cornerRadius(32)
                        }).padding(.bottom, 8)
                    }
                    CustomButton(title: Locale.buttonNext.value, action: {
                        self.viewModel.requestEnterprise()
                    })
                        .navigationBarTitle(Locale.mainNavBar.value)
                }.padding(16)
            }
            .sheet(isPresented: $viewModel.isPresentingAddModal, content: {
                HomeContentView(vm: self.viewModel)
            })
        }
        .onAppear(perform: {
            withAnimation(.spring()) {
                self.viewModel.fetchFavorites()
            }
        })
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainContentView()
    }
}
