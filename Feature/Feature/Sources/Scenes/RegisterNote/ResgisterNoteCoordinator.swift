//
//  ResgisterNoteCoordinator.swift
//  Feature
//
//  Created by Chrystian Salgado on 24/07/19.
//  Copyright © 2019 Salgado's Production. All rights reserved.
//

import UIKit

class ResgisterNoteCoordinator: CoordinatorProtocol {
    
    private let viewModel: ResgisterNoteViewModel?
    var presenter: UINavigationController?
    
    init(presenter: UINavigationController) {
        let viewModel = ResgisterNoteViewModel()
        
        self.viewModel = viewModel
        self.presenter = presenter
        self.presenter?.navigationBar.tintColor = .white
    }
    
    func start() {
        let storyboard = UIStoryboard(name: "RegisterNote", bundle: Bundle(for: ResgisterNoteViewController.self))
        let viewController = storyboard.instantiateViewController(withIdentifier: "ResgisterNoteViewController") as! ResgisterNoteViewController
        viewController.delegate = self
        viewController.viewModel = self.viewModel
        
        presenter?.pushViewController(viewController, animated: true)
        
    }
}

extension ResgisterNoteCoordinator: RegisterNoteViewControllerDelegate {
    
    func navigateToAdd(lastReceipt Id: Int) {
        presenter?.pushViewController(instantiateRegisterNoteController(lastReceipt: Id),
                                      animated: true)
    }
    
    private func instantiateRegisterNoteController(lastReceipt Id: Int) -> UIViewController {
        let identifier = "NewNoteViewController"
        let storyboardName = "RegisterNote"
        let storyboard = UIStoryboard(name: storyboardName,
                                      bundle: Bundle(for: NewNoteViewController.self))
        let viewController = storyboard.instantiateViewController(withIdentifier: identifier) as! NewNoteViewController
        let viewModel = NewNoteViewModel(lastReceipt: Id)
        
        viewModel.delegate = viewController
        viewModel.viewControllerDelegate = self
        viewController.viewModel = viewModel
        
        return viewController
    }
}

extension ResgisterNoteCoordinator: NewNoteViewControllerDelegate {
    
    func navigate() {
        presenter?.popViewController(animated: true)
    }
}
