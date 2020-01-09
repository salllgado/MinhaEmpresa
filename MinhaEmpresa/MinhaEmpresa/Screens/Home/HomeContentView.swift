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
    
    init(vm: MainViewModel, isPresenting: Bool = true) {
        viewModel = vm
        isPresentingAddModal = isPresenting
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.primaryColor
                .edgesIgnoringSafeArea(.all)
                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        Text("CNPJ")
                            .foregroundColor(Color.textColor)
                            .font(Font.system(size: 26, weight: .bold))
                        Text(viewModel.tfValue)
                            .foregroundColor(Color.textColor)
                            .font(Font.system(size: 22, weight: .semibold))
                    }
                    .padding(EdgeInsets(top: 6, leading: 20, bottom: -5, trailing: 20))
                    CustomDivider(color: .white)
                    Spacer()
                }
            }
            .navigationBarTitle("Salgado Soluções em tecnologia")
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
