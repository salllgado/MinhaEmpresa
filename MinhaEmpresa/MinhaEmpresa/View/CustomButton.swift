//
//  CustomButton.swift
//  MinhaEmpresa
//
//  Created by Chrystian on 07/05/20.
//  Copyright © 2020 Chrystian Salgado. All rights reserved.
//

import SwiftUI

struct CustomButton: View {
    
    var title: String = "Pressione"
    var action: ()->Void
    
    init(title: String, action: @escaping ()->Void) {
        self.title = title
        self.action = action
    }
    
    var body: some View {
        Button(action: {
            self.action()
        }, label: {
            ButtonStyle(text: title)
        })
            .background(Color.black)
            .cornerRadius(32)
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(title: "Me Aperte", action: {})
    }
}
