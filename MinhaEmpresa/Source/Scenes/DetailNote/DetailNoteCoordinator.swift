//
//  DetailNoteCoordinator.swift
//  MinhaEmpresa
//
//  Created by Chrystian Salgado on 21/09/19.
//  Copyright © 2019 Salgado's Production. All rights reserved.
//

import Foundation
import UIKit

class DetailNoteCoordinator: Coordinator {
    
    private let viewModel: DetailNoteViewModel?
    fileprivate var presenter: UINavigationController?
    
    init(presenter: UINavigationController, receipt: Receipt) {
        self.viewModel = DetailNoteViewModel(receipt: receipt)
        self.presenter = presenter
        self.presenter?.navigationBar.tintColor = .white
    }
    
    func start() {
        let storyboard = UIStoryboard(name: "RegisterNote", bundle: Bundle(for: DetailNoteViewController.self))
        let identifier = String(describing: DetailNoteViewController.self)
        let viewController = storyboard.instantiateViewController(withIdentifier: identifier) as! DetailNoteViewController
        viewController.viewControllerDelegate = self
        viewController.viewModel = self.viewModel
        
        presenter?.pushViewController(viewController, animated: true)
    }
}

extension DetailNoteCoordinator: DetailNoteViewControllerDelegate {
    
    func callInformation() {
        Logger.log("Information button tapped.")
    }
}
