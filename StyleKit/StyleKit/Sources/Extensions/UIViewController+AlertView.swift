//
//  UIViewController+AlertView.swift
//  StyleKit
//
//  Created by Chrystian Salgado on 08/09/19.
//  Copyright © 2019 Salgado's Production. All rights reserved.
//

import Foundation

public extension UIViewController {
    
    func showAlertController(title: String?, message: String, actions: [UIAlertAction]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        for action in actions {
            action.setupColorInTitleText()
            alert.addAction(action)
        }
        
        self.present(alert, animated: true, completion: nil)
    }
}

extension UIAlertController {
    
    // Setup primary color in alert actions
    func setupColorInAlertActions() {
        for action in self.actions {
            action.setupColorInTitleText()
        }
    }
}

extension UIAlertAction {
    
    /// Setup Color in button
    func setupColorInTitleText() {
        self.setValue(primaryColor, forKey: "titleTextColor")
    }
}
