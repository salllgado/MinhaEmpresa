//
//  Localizer.swift
//  MinhaEmpresa
//
//  Created by Chrystian Salgado on 07/09/19.
//  Copyright © 2019 Salgado's Production. All rights reserved.
//

import Foundation

class Localizer {
    
    /// Return string from Localizable.strings
    class func stringProj(_ key: String) -> String {
        return NSLocalizedString(key, comment: "")
    }
}
