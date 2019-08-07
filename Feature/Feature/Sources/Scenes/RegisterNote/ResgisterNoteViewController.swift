//
//  ResgisterNoteViewController.swift
//  Feature
//
//  Created by Chrystian Salgado on 24/07/19.
//  Copyright © 2019 Salgado's Production. All rights reserved.
//

import UIKit

class ResgisterNoteViewController: UIViewController {
    
    @IBOutlet weak var registrationNoteView: RegistrationNoteView!
    
    var viewModel: ResgisterNoteViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    /// This method load all ui components in view.
    private func setupUI() {
        title = "Notas"
        
        // register table view cell.
        let nib = UINib(nibName: "RegisterNoteTableViewCell", bundle: Bundle(for: RegisterNoteTableViewCell.self))
        registrationNoteView.tableView.register(nib, forCellReuseIdentifier: "TableViewCellIdentifier")
        
        // header view
        let headerView = RegisterNoteHeaderView()
        headerView.btnCustom.setTitle("Registrar Nota", for: .normal)
        headerView.delegate = self
        headerView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 76)
        registrationNoteView.tableView.tableHeaderView = headerView
        
        // table view
        registrationNoteView.tableView.delegate = self
        registrationNoteView.tableView.dataSource = self
        registrationNoteView.tableView.rowHeight = UITableView.automaticDimension
    }
}

extension ResgisterNoteViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellIdentifier") as! RegisterNoteTableViewCell
        cell.delegate = self
        
        return cell
    }
}

extension ResgisterNoteViewController: ResgisterNoteHeaderViewDelegate {
    func actionNewNote() {
        print("Button tapped")
    }
}

extension ResgisterNoteViewController: RegisterNoteTableViewCellDelegate {
    func actionSelected() {
        print("Cell tapped")
    }
}
