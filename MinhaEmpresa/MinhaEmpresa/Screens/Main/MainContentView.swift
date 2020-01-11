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
        viewModel.getUserCNPJ()
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.blue.opacity(0.65)
                    .edgesIgnoringSafeArea(.all)
                VStack(alignment: .leading) {
                    Text("Informe seu CNPJ e obtenha os dados da sua empresa")
                        .font(Font.system(size: 28, weight: .bold))
                    TextField("00.000.000/000-01", text: $viewModel.tfValue)
                        .padding(EdgeInsets(
                            top: 0,
                            leading: 0,
                            bottom: 80,
                            trailing: 0))
                    Spacer()
                    Button(action: {
                        self.viewModel.requestEnterprise()
                    }, label: {
                        HStack {
                            Spacer()
                            Text("Continuar")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.vertical, 12)
                            Spacer()
                        }
                    })
                        .background(Color.black)
                        .cornerRadius(32)
                        .navigationBarTitle("Sua Empresa")
                }.padding(16)
            }
            .sheet(isPresented: $viewModel.isPresentingAddModal, content: {
                HomeContentView(vm: self.viewModel)
            })
        }
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainContentView()
    }
}
