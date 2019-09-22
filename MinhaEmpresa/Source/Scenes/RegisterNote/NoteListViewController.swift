//
//  ResgisterNoteViewController.swift
//  Feature
//
//  Created by Chrystian Salgado on 24/07/19.
//  Copyright © 2019 Salgado's Production. All rights reserved.
//

import UIKit
import StyleKit

protocol NoteListViewControllerDelegate: class {
    func navigateToAdd(lastReceipt Id: Int)
    func navigateToDetail(sender: Receipt)
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
        return 1
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
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.viewModel?.removeReceipt(receipt: (viewModel?.notes[indexPath.row])!)
            self.registrationNoteView.tableView.beginUpdates()
            self.registrationNoteView.tableView.deleteRows(at: [indexPath], with: .automatic)
            self.registrationNoteView.tableView.endUpdates()
            
        }
    }
}

extension NoteListViewController: NoteListHeaderViewDelegate {
    
    func actionNewNote() {
        delegate?.navigateToAdd(lastReceipt: viewModel?.notes.count ?? 0 + 1 )
    }
}

extension NoteListViewController: NoteListTableViewCellDelegate {

    func actionSelected(_ receipt: Receipt) {
        delegate?.navigateToDetail(sender: receipt)
    }
}
