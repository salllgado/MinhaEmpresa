//
//  String+Logger.swift
//  MinhaEmpresa
//
//  Created by Chrystian Salgado on 08/07/19.
//  Copyright © 2019 Salgado's Production. All rights reserved.
//

import Foundation

class Logger {
    
    /// Print some string just in DEBUG mode.
    func log(_ printable: Any?) {
        #if DEBUG
        print(printable)
        #endif
    }
}
