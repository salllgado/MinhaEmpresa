//
//  RowView.swift
//  MinhaEmpresa
//
//  Created by Chrystian Salgado on 11/01/20.
//  Copyright © 2020 Chrystian Salgado. All rights reserved.
//

import SwiftUI

struct RowView: View {
    
    let title: String
    let value: String
    
    init(title: String, value: String) {
        self.title = title
        self.value = value
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text(title)
                    .foregroundColor(Color.textColor)
                    .font(Font.system(size: 26, weight: .bold))
                Text(value)
                    .foregroundColor(Color.textColor)
                    .font(Font.system(size: 22, weight: .semibold))
            }
            .padding(EdgeInsets(top: 6, leading: 20, bottom: -5, trailing: 20))
            CustomDivider(color: .white)
        }
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(title: "CNPJ", value: "13")
            .background(Color.blue)
    }
}
