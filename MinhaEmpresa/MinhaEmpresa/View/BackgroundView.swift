//
//  BackgroundView.swift
//  MinhaEmpresa
//
//  Created by Chrystian Salgado on 12/01/20.
//  Copyright © 2020 Chrystian Salgado. All rights reserved.
//

import Foundation
import SwiftUI

struct BackgroundView: View {
    
    var body: some View {
        ZStack {
            Image("wallpaper")
                .blur(radius: 3)
            Color.primaryColor
                .edgesIgnoringSafeArea(.all)
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
