//
//  Locale.swift
//  MinhaEmpresa
//
//  Created by Chrystian on 23/05/20.
//  Copyright © 2020 Chrystian Salgado. All rights reserved.
//

import Foundation

enum Locale: String {
    case mainTextFieldPlaceholder = "textFieldPlaceholderText"
    
    var value: String {
        return NSLocalizedString(self.rawValue, comment: "")
    }
}
