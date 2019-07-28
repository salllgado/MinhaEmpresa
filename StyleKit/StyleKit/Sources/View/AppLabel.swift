//
//  AppLabel.swift
//  StyleKit
//
//  Created by Chrystian Salgado on 28/07/19.
//  Copyright © 2019 Salgado's Production. All rights reserved.
//

import Foundation

@IBDesignable
class AppLabel: UILabel {
    
    @IBInspectable
    var labelTextStyle: Int {
        get {
            return tintColor == primaryColor ? 1 : 2
        }
        set {
            switch newValue {
            case 1:
                textColor = primaryColor
            case 2:
                textColor = secondaryColor
            default:
                textColor = primaryColor
            }
        }
    }
}
