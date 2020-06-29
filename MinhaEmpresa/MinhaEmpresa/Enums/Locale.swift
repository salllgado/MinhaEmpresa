//
//  Locale.swift
//  MinhaEmpresa
//
//  Created by Chrystian on 23/05/20.
//  Copyright © 2020 Chrystian Salgado. All rights reserved.
//

import Foundation

enum Locale: String {
    case mainTextFieldPlaceholder
    case mainNavBarText
    case buttonNextText
    case mainSubtitleText
    case favoriteButtonText
    
    var value: String {
        return NSLocalizedString(self.rawValue, comment: "")
    }
}
