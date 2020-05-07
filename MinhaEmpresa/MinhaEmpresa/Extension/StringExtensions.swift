//
//  StringExtensions.swift
//  MinhaEmpresa
//
//  Created by Chrystian on 07/05/20.
//  Copyright © 2020 Chrystian Salgado. All rights reserved.
//

import Foundation

extension String {
    
    func normalizeValue() -> String {
        let blockedCharacters: [Character] = ["/", ".", "-"]
        
        return self.filter { (char) -> Bool in
            !(blockedCharacters.contains(char))
        }
    }
}
