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
                Color.primaryColor
                    .edgesIgnoringSafeArea(.all)
                    .opacity(0.9)
                VStack {
                    RowView(title: "CNPJ", value: viewModel.userEnterprise?.cnpj ?? viewModel.tfValue)
                    RowView(title: "Nome", value: viewModel.userEnterprise?.enterpriseName ?? "")
                    RowView(title: "Abertura", value: viewModel.userEnterprise?.fondationDate ?? "")
                    Spacer()
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
