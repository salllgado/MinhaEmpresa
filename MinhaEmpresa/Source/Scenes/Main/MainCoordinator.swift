//
//  MainCoordinator.swift
//  MinhaEmpresa
//
//  Created by Chrystian Salgado on 20/07/19.
//  Copyright © 2019 Salgado's Production. All rights reserved.
//

import UIKit

class MainCoordinator: Coordinator {
    private let presenter: UINavigationController
    private var mainViewController: MainViewController?
    private var homeCoordinator: HomeCoordinator?
    private let mainViewModel: MainViewModel?
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
        self.mainViewModel = MainViewModel()
    }
    
    func start() {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let viewController = storyboard.instantiateInitialViewController() as! MainViewController
        
        viewController.delegate = self
        viewController.viewModel = mainViewModel
        presenter.setNavigationBarHidden(true, animated: false)
        presenter.pushViewController(viewController, animated: true)
        
        self.mainViewController = viewController
    }
}

extension MainCoordinator: MainViewControllerDelegate {
    func navigate(with param: Enterprise) {
        homeCoordinator = HomeCoordinator(presenter: presenter, param: param)
        homeCoordinator?.start()
    }
}
