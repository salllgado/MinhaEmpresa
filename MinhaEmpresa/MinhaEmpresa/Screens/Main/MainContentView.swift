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
                BackgroundView()
                    .frame(width: 200, height: 400, alignment: .center)
                VStack(alignment: .leading) {
                    Text(NSLocalizedString("mainSubtitleText", comment: ""))
                        .font(Font.system(size: 28, weight: .bold))
                        .foregroundColor(Color.textSecondary)
                    CustomTextField(title: NSLocalizedString("textFieldPlaceholderText", comment: ""), value: $viewModel.tfValue)
                        .padding(EdgeInsets(
                            top: 0,
                            leading: 0,
                            bottom: 80,
                            trailing: 0))
                    Spacer()
                    CustomButton(title: NSLocalizedString("buttonNextText", comment: ""), action: {
                        self.viewModel.requestEnterprise()
                    })
                        .navigationBarTitle(NSLocalizedString("mainNavBarText", comment: ""))
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
