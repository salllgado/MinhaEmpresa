//
//  ResgisterNoteViewController.swift
//  Feature
//
//  Created by Chrystian Salgado on 24/07/19.
//  Copyright © 2019 Salgado's Production. All rights reserved.
//

import UIKit
import StyleKit

protocol NoteListViewControllerDelegate {
    func navigateToAdd(lastReceipt Id: Int)
}

class NoteListViewController: UIViewController {
    
    @IBOutlet weak var registrationNoteView: NoteListView!
    
    private var loadingView: LoadingView?
    
    var viewModel: NoteListViewModel?
    var delegate: NoteListViewControllerDelegate?
    
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
        title = Localizer.stringProj("NOTES_TITLE")
        
        // table view
        registrationNoteView.tableView.delegate = self
        registrationNoteView.tableView.dataSource = self
        
        guard let tableHeaderView = registrationNoteView.tableView.tableHeaderView as? NoteListHeaderView else { return }
        tableHeaderView.delegate = self
        
        loadingView = LoadingView(color: primaryColor)
    }
}

extension NoteListViewController: NoteListDelegate {
    
    func fetchNotesResponds() {
        registrationNoteView.tableView.reloadData()
    }
    
    func loading(_ isLoading: Bool) {
        isLoading ? loadingView?.showLoading(in: self.view) : loadingView?.dismissLoading()
    }
}

extension NoteListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel?.notes.count ?? 0 > 0 ? 1 : 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.notes.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteListTableViewCell") as! NoteListTableViewCell
        cell.delegate = self
        cell.configure(viewModel!.notes[indexPath.row])
        
        return cell
    }
}

extension NoteListViewController: NoteListHeaderViewDelegate {
    
    func actionNewNote() {
        delegate?.navigateToAdd(lastReceipt: viewModel?.notes.count ?? 0 + 1 )
    }
}

extension NoteListViewController: NoteListTableViewCellDelegate {
    
    func actionSelected() {
        print("Cell tapped")
    }
}
