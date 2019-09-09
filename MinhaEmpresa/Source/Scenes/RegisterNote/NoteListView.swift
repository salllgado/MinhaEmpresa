//
//  RegistrationNoteView.swift
//  Feature
//
//  Created by Chrystian Salgado on 27/07/19.
//  Copyright © 2019 Salgado's Production. All rights reserved.
//

import UIKit

class NoteListView: UIView {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // register table view cell.
        let nib = UINib(nibName: "RegisterNoteTableViewCell", bundle: Bundle(for: NoteListTableViewCell.self))
        tableView.register(nib, forCellReuseIdentifier: "TableViewCellIdentifier")
        
        // header view
        let headerView = NoteListHeaderView()
        headerView.btnCustom.setTitle("Registrar Nota", for: .normal)
        headerView.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: 76)
        tableView.tableHeaderView = headerView
        
        tableView.estimatedRowHeight = 98.0
        tableView.rowHeight = UITableView.automaticDimension
    }
}
