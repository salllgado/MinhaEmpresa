//
//  ColorAsset.swift
//  MinhaEmpresa
//
//  Created by Chrystian Salgado on 09/01/20.
//  Copyright © 2020 Chrystian Salgado. All rights reserved.
//

import SwiftUI

extension Color {
    
    static var primaryColor = Color.init(UIColor(named: "Primary") ?? UIColor.yellow)
    static var secondaryColor = Color.init(UIColor(named: "Secondary") ?? UIColor.black)
    
    static var textColor = Color.init(UIColor.white)
    static var textSecondary = Color.init(UIColor(named: "Secondary") ?? UIColor.black)
}
