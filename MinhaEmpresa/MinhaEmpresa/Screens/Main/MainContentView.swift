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
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                    .frame(width: 200, height: 400, alignment: .center)
                    .edgesIgnoringSafeArea(.all)
                if self.$viewModel.isLoading.wrappedValue {
                    ProgressView()
                        .background(Color.white)
                }
                VStack(alignment: .leading) {
                    Text(Locale.mainSubtitleText.value)
                        .font(Font.system(size: 28, weight: .bold))
                        .foregroundColor(Color.textSecondary)
                    CustomTextField(title: "CNPJ", value: $viewModel.tfValue)
                        .padding(EdgeInsets(
                                    top: 0,
                                    leading: 0,
                                    bottom: 80,
                                    trailing: 0))
                    Spacer()
                    CustomButton(title: Locale.buttonNextText.value, action: {
                        self.viewModel.requestEnterprise()
                    })
                    .navigationBarTitle(Locale.mainNavBarText.value)
                }.padding(16)
            }
            .fullScreenCover(isPresented: $viewModel.isPresentingAddModal, content: {
                HomeContentView(vm: self.viewModel)
            })
            .alert(isPresented: $viewModel.showingAlert) {
                Alert(title: Text(viewModel.alertMessage?.prettyError ?? LocalizedError.unknown.prettyError), message: nil, dismissButton: .default(Text("OK")))
            }
        }
        .accentColor(Color.primaryColor)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainContentView()
    }
}
