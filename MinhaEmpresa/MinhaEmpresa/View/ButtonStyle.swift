//
//  ButtonStyle.swift
//  MinhaEmpresa
//
//  Created by Chrystian Salgado on 12/01/20.
//  Copyright © 2020 Chrystian Salgado. All rights reserved.
//

import Foundation
import SwiftUI

struct ButtonStyle: View {
    
    private (set) var buttonText: String = ""
    
    init(text: String) {
        self.buttonText = text
    }
    
    var body: some View {
        HStack {
            Spacer()
            Text(buttonText)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.vertical, 12)
            Spacer()
        }
    }
}
