//
//  Feature.swift
//  Feature
//
//  Created by Chrystian Salgado on 24/07/19.
//  Copyright © 2019 Salgado's Production. All rights reserved.
//

import UIKit

public class Feature {
    
    init() {
        // ...
    }
    
    public class func registerNote(presenter: UINavigationController) -> CoordinatorProtocol {
        let registerNoteCoordinator = ResgisterNoteCoordinator()
        registerNoteCoordinator.presenter = presenter
        return registerNoteCoordinator
    }
}
