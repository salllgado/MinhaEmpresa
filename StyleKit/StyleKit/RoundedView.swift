//
//  RoundedView.swift
//  StyleKit
//
//  Created by Chrystian Salgado on 27/07/19.
//  Copyright © 2019 Salgado's Production. All rights reserved.
//

import UIKit

@IBDesignable
public class RoundedView: UIView {
    
    @IBInspectable
    var roundedView: Bool {
        get {
            return frame.height == layer.cornerRadius * 2
        }
        set {
            if newValue {
                layer.cornerRadius = self.frame.height/2
            }
        }
    }
}
