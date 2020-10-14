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
    @ObservedObject var viewModel: MainViewModel
    
    init(vm: MainViewModel) {
        viewModel = vm
        isPresentingAddModal = viewModel.isPresentingAddModal
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                    .frame(width: 200, height: 400, alignment: .center)
                VStack {
                    RowView(title: "CNPJ", value: viewModel.userEnterprise?.cnpj ?? viewModel.tfValue)
                    RowView(title: "Nome", value: viewModel.userEnterprise?.enterpriseName ?? "")
                    RowView(title: "Abertura", value: viewModel.userEnterprise?.fondationDate ?? "")
                    Spacer()
                    CustomButton(title: "Deslogar", action: {
                        self.viewModel.logout()
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
        func getViewModel() -> MainViewModel {
            let vm = MainViewModel()
            vm.tfValue = "13"
            
            return vm
        }
        
        return HomeContentView(vm: getViewModel())
    }
}
