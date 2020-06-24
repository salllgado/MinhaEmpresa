//
//  Locale.swift
//  MinhaEmpresa
//
//  Created by Chrystian on 23/05/20.
//  Copyright © 2020 Chrystian Salgado. All rights reserved.
//

import Foundation

enum Locale: String {
    case mainTextFieldPlaceholder = "mainTextFieldPlaceholder"
    case mainNavBar = "mainNavBarText"
    case buttonNext = "buttonNextText"
    case mainSubtitle = "mainSubtitleText"
    
    var value: String {
        return NSLocalizedString(self.rawValue, comment: "")
    }
}
