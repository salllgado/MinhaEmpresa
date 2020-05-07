//
//  ShortcutManager.swift
//  MinhaEmpresa
//
//  Created by Chrystian on 21/04/20.
//  Copyright © 2020 Chrystian Salgado. All rights reserved.
//

import Foundation
import UIKit

enum RegisteredItems: String {
    case newCNPJ = "newCNPJ"
    
    func registerNewItem(cnpj: String) {
        switch self {
        case .newCNPJ:
            let userInfo = ["enterpriseCNPJ": cnpj]
            
            if #available(iOS 9.1, *) {
                let shortcutItem = UIApplicationShortcutItem(type: self.rawValue, localizedTitle: cnpj, localizedSubtitle: nil, icon: .init(type: .favorite), userInfo: userInfo as [String : NSSecureCoding])
                setNewShortcutItem(shortcutItem)
            }
        }
    }
}

extension RegisteredItems {
    
    func setNewShortcutItem(_ shortcutItem: UIApplicationShortcutItem) {
        if UIApplication.shared.shortcutItems?.count ?? 0 <= 3 {
            var shortcutItems = UIApplication.shared.shortcutItems?.filter({ (item) -> Bool in
                item.userInfo?["enterpriseCNPJ"] as? String != shortcutItem.userInfo?["enterpriseCNPJ"] as? String
            })
            
            shortcutItems?.append(shortcutItem)
            UIApplication.shared.shortcutItems = shortcutItems
        }
    }
}

class ShortcutManager {
    
    func flush() {
        UIApplication.shared.shortcutItems = []
    }
}
