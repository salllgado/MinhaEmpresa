//
//  SceneDelegate.swift
//  MinhaEmpresa
//
//  Created by Chrystian Salgado on 16/09/19.
//  Copyright © 2019 Salgado's Production. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    private var applicationCoordinator: AppCoordinator?
    
    @available(iOS 13.0, *)
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let appCoordinator = AppCoordinator(window: window!)
        applicationCoordinator = appCoordinator
        
        applicationCoordinator?.start()
    }
}
