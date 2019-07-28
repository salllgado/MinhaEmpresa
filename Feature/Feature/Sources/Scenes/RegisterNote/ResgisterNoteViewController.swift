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
        
        registrationNoteView.delegate = self
        registrationNoteView.tableView.delegate = self
        registrationNoteView.tableView.dataSource = self
        registrationNoteView.tableView.rowHeight = 80.0
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
        return UITableViewCell()
    }
}

extension ResgisterNoteViewController: ResgisterNoteViewDelegate {
    
    func actionNewNote() {
        print("Button tapped")
    }
}
