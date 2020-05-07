//
//  CustomButton.swift
//  MinhaEmpresa
//
//  Created by Chrystian on 07/05/20.
//  Copyright © 2020 Chrystian Salgado. All rights reserved.
//

import SwiftUI

struct CustomButton: View {
    
    enum Style {
        case primary
        case secondary
    }
    
    var title: String = "Pressione"
    var action: ()->Void
    var buttonStyle: Style = .primary
    
    init(title: String, action: @escaping ()->Void, buttonStyle: Style = .primary) {
        self.title = title
        self.action = action
        self.buttonStyle = buttonStyle
    }
    
    var body: some View {
        Button(action: {
            self.action()
        }, label: {
            ButtonStyle(text: title)
        })
        .background(getButtonColor())
        .cornerRadius(32)
    }
    
    func getButtonColor() -> Color {
        switch buttonStyle {
        case .primary:
            return Color.black
        case .secondary:
            return Color.secondaryColor
        }
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(title: "Me Aperte", action: {})
        .padding()
    }
}
