//
//  PrimaryButton.swift
//  StyleKit
//
//  Created by Chrystian Salgado on 28/07/19.
//  Copyright © 2019 Salgado's Production. All rights reserved.
//

import Foundation

enum ButtonStyle {
    case primary
    case secondary
}

@IBDesignable
class AppButton: UIButton {
    
    @IBInspectable
    var buttonStyle: Int {
        get {
            return backgroundColor == .blue ? 1 : 2
        }
        set {
            layer.cornerRadius = 10
            titleLabel?.font = UIFont.boldSystemFont(ofSize: 17.0)
            
            switch newValue {
            case 1:
                setupButtonColor(buttonStyle: .primary)
            case 2:
                setupButtonColor(buttonStyle: .secondary)
            default:
                setupButtonColor(buttonStyle: .primary)
            }
        }
    }
    
    private func setupButtonColor(buttonStyle: ButtonStyle) {
        switch buttonStyle {
        case .primary:
            backgroundColor = primaryColor
            setTitleColor(secondaryColor, for: .normal)
        case .secondary:
            backgroundColor = secondaryColor
            setTitleColor(primaryColor, for: .normal)
        }
    }
}
