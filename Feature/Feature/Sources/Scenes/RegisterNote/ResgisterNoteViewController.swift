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
    
    private func setupUI() {
        title = "Notas"
        
        let nib = UINib(nibName: "RegisterNoteTableViewCell", bundle: Bundle(for: RegisterNoteTableViewCell.self))
        registrationNoteView.tableView.register(nib, forCellReuseIdentifier: "TableViewCellIdentifier")
        
        let headerView = RegisterNoteHeaderView()
        headerView.delegate = self
        headerView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 76)
        registrationNoteView.tableView.tableHeaderView = headerView
        
        registrationNoteView.tableView.delegate = self
        registrationNoteView.tableView.dataSource = self
        registrationNoteView.tableView.rowHeight = 98.0
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
        return cell
    }
}

extension ResgisterNoteViewController: ResgisterNoteHeaderViewDelegate {
    
    func actionNewNote() {
        print("Button tapped")
    }
}
