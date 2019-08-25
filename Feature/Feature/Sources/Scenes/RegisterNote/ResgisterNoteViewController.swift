//
//  ResgisterNoteViewController.swift
//  Feature
//
//  Created by Chrystian Salgado on 24/07/19.
//  Copyright © 2019 Salgado's Production. All rights reserved.
//

import UIKit

protocol RegisterNoteViewControllerDelegate {
    func navigateToAdd(lastReceipt Id: Int)
}

class ResgisterNoteViewController: UIViewController {
    
    @IBOutlet weak var registrationNoteView: RegistrationNoteView!
    
    var viewModel: ResgisterNoteViewModel?
    var delegate: RegisterNoteViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.delegate = self
        
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel?.fetchNotes()
    }
    
    /// This method load all ui components in view.
    private func setupUI() {
        title = "Notas"
        
        // table view
        registrationNoteView.tableView.delegate = self
        registrationNoteView.tableView.dataSource = self
        
        guard let tableHeaderView = registrationNoteView.tableView.tableHeaderView as? RegisterNoteHeaderView else { return }
        tableHeaderView.delegate = self
    }
}

extension ResgisterNoteViewController: RegisterNoteDelegate {
    
    func fetchNotesResponds() {
        registrationNoteView.tableView.reloadData()
    }
}

extension ResgisterNoteViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel?.notes.count ?? 0 > 0 ? 1 : 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.notes.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellIdentifier") as! RegisterNoteTableViewCell
        cell.delegate = self
        cell.configure(viewModel!.notes[indexPath.row])
        
        return cell
    }
}

extension ResgisterNoteViewController: ResgisterNoteHeaderViewDelegate {
    
    func actionNewNote() {
        delegate?.navigateToAdd(lastReceipt: viewModel?.notes.count ?? 0 + 1 )
    }
}

extension ResgisterNoteViewController: RegisterNoteTableViewCellDelegate {
    
    func actionSelected() {
        print("Cell tapped")
    }
}
