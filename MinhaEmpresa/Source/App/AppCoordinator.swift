//
//  AppCoordinator.swift
//  MinhaEmpresa
//
//  Created by Chrystian Salgado on 20/07/19.
//  Copyright © 2019 Salgado's Production. All rights reserved.
//

/*
 - Documentation - https://www.raywenderlich.com/158-coordinator-tutorial-for-ios-getting-started
*/

import UIKit

protocol Coordinator {
    func start()
}

class AppCoordinator {
    let window: UIWindow
    let rootViewController: UINavigationController
    let mainCoordinator: MainCoordinator
    
    init(window: UIWindow) {
        self.window = window
        rootViewController = UINavigationController()
        mainCoordinator = MainCoordinator(presenter: rootViewController)
    }
    
    func start() {
        window.rootViewController = rootViewController
        mainCoordinator.start()
        window.makeKeyAndVisible()
    }
}
