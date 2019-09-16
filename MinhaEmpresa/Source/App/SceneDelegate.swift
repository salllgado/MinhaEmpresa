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
        let windowScene = UIWindowScene(session: session, connectionOptions: connectionOptions)
        let window = UIWindow(windowScene: windowScene)
        
        let appCoordinator = AppCoordinator(window: window)
        
        self.window = window
        applicationCoordinator = appCoordinator
        
        applicationCoordinator?.start()

        
        self.window = window
        window.makeKeyAndVisible()
    }
}
