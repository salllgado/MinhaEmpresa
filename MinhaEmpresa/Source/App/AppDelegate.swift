//
//  AppDelegate.swift
//  MinhaEmpresa
//
//  Created by Chrystian Salgado on 06/07/19.
//  Copyright © 2019 Salgado's Production. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    private var applicationCoordinator: AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        application.statusBarStyle = .lightContent
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        let appCoordinator = AppCoordinator(window: window)
        
        
        self.window = window
        applicationCoordinator = appCoordinator
        
        applicationCoordinator?.start()
        return true
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        CoreDataHelper.shared.saveContext()
    }
}

