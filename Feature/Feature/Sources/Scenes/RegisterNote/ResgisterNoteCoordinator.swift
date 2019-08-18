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
    
    func navigateToAdd() {
        let storyboard = UIStoryboard(name: "RegisterNote", bundle: Bundle(for: NewNoteViewController.self))
        let viewController = storyboard.instantiateViewController(withIdentifier: "NewNoteViewController") as! NewNoteViewController
        viewController.viewModel = NewNoteViewModel()
        presenter?.pushViewController(viewController, animated: true)
    }
}
