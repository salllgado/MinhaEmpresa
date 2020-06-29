//
//  AppDelegateShortcut.swift
//  MinhaEmpresa
//
//  Created by Chrystian on 29/06/20.
//  Copyright © 2020 Chrystian Salgado. All rights reserved.
//

import Foundation
import UIKit

extension AppDelegate {
    
    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
            print("shortcut fired !!!")
    //        guard let mainContentView = SceneDelegate.shared?.window?.rootViewController as? MainContentView else { return }
    //        guard let value = shortcutItem.userInfo?["enterpriseCNPJ"] as? String else { return }
    //        mainContentView.viewModel.tfValue = value.normalizeValue()
    //        mainContentView.viewModel.requestEnterprise()
        }
}
