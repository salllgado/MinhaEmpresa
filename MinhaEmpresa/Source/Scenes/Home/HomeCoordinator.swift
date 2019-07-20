//
//  HomeCoordinator.swift
//  MinhaEmpresa
//
//  Created by Chrystian Salgado on 20/07/19.
//  Copyright © 2019 Salgado's Production. All rights reserved.
//

import UIKit

class HomeCoordinator: Coordinator {
    
    private let presenter: UINavigationController
    private var homeViewController: HomeViewController?
    private var viewModel: HomeViewModel!
    
    init(presenter: UINavigationController, param: Enterprise) {
        let viewModel = HomeViewModel()
        
        viewModel.enterprise = param
        self.viewModel = viewModel
        self.presenter = presenter
    }
    
    func start() {
        let storyboard = UIStoryboard(name: "Home", bundle: .main)
        let navigationController = storyboard.instantiateInitialViewController() as! UINavigationController
        
        if let viewController = navigationController.viewControllers.first as? HomeViewController {
            viewController.viewModel = viewModel
            self.homeViewController = viewController
        }
        
        presenter.present(navigationController, animated: true, completion: nil)
    }
}
