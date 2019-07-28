//
//  RegistrationNoteView.swift
//  Feature
//
//  Created by Chrystian Salgado on 27/07/19.
//  Copyright © 2019 Salgado's Production. All rights reserved.
//

import UIKit

protocol ResgisterNoteViewDelegate: class {
    func actionNewNote()
}

class RegistrationNoteView: UIView {
    
    @IBOutlet weak var tableView: UITableView!
    
    var delegate: ResgisterNoteViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func actionNewNote(_ sender: Any) {
        delegate?.actionNewNote()
    }
}
