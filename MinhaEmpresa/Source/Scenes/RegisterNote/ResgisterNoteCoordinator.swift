//
//  ResgisterNoteCoordinator.swift
//  Feature
//
//  Created by Chrystian Salgado on 24/07/19.
//  Copyright © 2019 Salgado's Production. All rights reserved.
//

import UIKit

class ResgisterNoteCoordinator: Coordinator {
    
    private let viewModel: NoteListViewModel?
    var presenter: UINavigationController?
    
    init(presenter: UINavigationController) {
        let viewModel = NoteListViewModel()
        
        self.viewModel = viewModel
        self.presenter = presenter
        self.presenter?.navigationBar.tintColor = .white
    }
    
    func start() {
        let storyboard = UIStoryboard(name: "RegisterNote", bundle: Bundle(for: NoteListViewController.self))
        let identifier = String(describing: NoteListViewController.self)
        let viewController = storyboard.instantiateViewController(withIdentifier: identifier) as! NoteListViewController
        viewController.delegate = self
        viewController.viewModel = self.viewModel
        
        presenter?.pushViewController(viewController, animated: true)
        
    }
}

extension ResgisterNoteCoordinator: NoteListViewControllerDelegate {
    
    func navigateToAdd(lastReceipt Id: Int) {
        presenter?.pushViewController(instantiateRegisterNoteController(lastReceipt: Id),
                                      animated: true)
    }
    
    func navigateToDetail(sender: Receipt) {
        let coordinator = DetailNoteCoordinator(presenter: self.presenter ?? UINavigationController(), receipt: sender)
        coordinator.start()
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
    
    func navigateToSearchNote() {
        let viewController = instantiateNoteFinderViewController()
        presenter?.pushViewController(viewController, animated: true)
    }
    
    private func instantiateNoteFinderViewController() -> UIViewController {
        let identifier = "NoteFinderViewController"
        let storyboardName = "NoteFinder"
        let storyboard = UIStoryboard(name: storyboardName,
                                      bundle: Bundle(for: NoteFinderViewController.self))
        let viewController = storyboard.instantiateViewController(withIdentifier: identifier) as! NoteFinderViewController
        let viewModel = NoteFinderViewModel()
        
        viewModel.delegate = viewController
//        viewModel.viewControllerDelegate = self
        viewController.viewModel = viewModel
        
        return viewController
    }
}
