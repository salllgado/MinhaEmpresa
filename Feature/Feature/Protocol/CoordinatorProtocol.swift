//
//  CoordinatorProtocol.swift
//  Feature
//
//  Created by Chrystian Salgado on 24/07/19.
//  Copyright © 2019 Salgado's Production. All rights reserved.
//

import Foundation

public protocol CoordinatorProtocol {
    func start()
}

public protocol ResgistratioNoteParams {
    
    var presenter: UINavigationController { get set } 
}
