//
//  HomeCoordinator.swift
//  MinhaEmpresa
//
//  Created by Chrystian Salgado on 20/07/19.
//  Copyright © 2019 Salgado's Production. All rights reserved.
//

import UIKit
import CSUtils
import Feature
import NetworkKit

class HomeCoordinator: Coordinator {
    
    private var presenter: UINavigationController
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
        let navigationController = setupNavigationBar(
            nav: storyboard.instantiateInitialViewController() as! UINavigationController
        )
        
        if let viewController = navigationController.viewControllers.first as? HomeViewController {
            viewController.delegate = self
            viewController.viewModel = viewModel
            self.homeViewController = viewController
        }
        
        presenter.present(navigationController, animated: true, completion: {
            guard let navigationController = self.homeViewController?.navigationController else { return }
            self.presenter = navigationController
        })
    }
}

extension HomeCoordinator {
    
    private func setupNavigationBar(nav: UINavigationController) -> UINavigationController {
        let attr: [NSAttributedString.Key : Any] = [.foregroundColor: UIColor.white]
        
        nav.navigationBar.prefersLargeTitles = true
        nav.navigationBar.titleTextAttributes = attr
        nav.navigationBar.largeTitleTextAttributes = attr
        nav.navigationBar.barTintColor = "#040E1D".hexColor()
        return nav
    }
}

extension HomeCoordinator: HomeViewControllerDelegate {
    
    func navigate(param: Enterprise) {
        navigateToFeature()
    }
    
    func navigateToFeature() {
        let param = RegistrationNoteParam(presenter: self.presenter)
        let destinationCoordinator = Feature.registerNote(param)
        destinationCoordinator.start()
    }
}

struct RegistrationNoteParam: ResgistratioNoteParams {
    var presenter: UINavigationController
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
}
