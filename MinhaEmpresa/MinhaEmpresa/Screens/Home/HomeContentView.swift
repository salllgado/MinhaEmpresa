//
//  HomeContentView.swift
//  MinhaEmpresa
//
//  Created by Chrystian Salgado on 09/01/20.
//  Copyright © 2020 Chrystian Salgado. All rights reserved.
//

import SwiftUI

struct HomeContentView: View {
    
    @State var isPresentingAddModal: Bool = false
    @ObservedObject var viewModel: HomeViewModel
    
    init(vm: HomeViewModel, isModalPresented: Bool = true) {
        viewModel = vm
        isPresentingAddModal = true
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                    .frame(width: 200, height: 400, alignment: .center)
                VStack {
                    RowView(title: "CNPJ", value: viewModel.userEnterprise?.cnpj ?? "")
                    RowView(title: "Nome", value: viewModel.userEnterprise?.enterpriseName ?? "")
                    RowView(title: "Abertura", value: viewModel.userEnterprise?.fondationDate ?? "")
                    Spacer()
                    HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 8, content: {
                        CustomButton(title: "Deslogar", action: {
                            self.viewModel.logout()
                        })
                        CustomButton(title: "Favoritar", action: {
                            self.viewModel.saveOnFavorites()
                        }, buttonStyle: .secondary)
                    })
                    .padding(EdgeInsets(top: 4, leading: 16, bottom: 8, trailing: 16))
                }
            }
            .navigationBarTitle(viewModel.userEnterprise?.nickname ?? "Minha Empresa")
        }
    }
}

struct HomeContentView_Previews: PreviewProvider {
    static var previews: some View {
        func getViewModel() -> HomeViewModel {
            let vm = HomeViewModel(enterprise: Enterprise(cnpj: "31313131313131"), delegate: nil)
            return vm
        }
        
        return HomeContentView(vm: getViewModel())
    }
}
