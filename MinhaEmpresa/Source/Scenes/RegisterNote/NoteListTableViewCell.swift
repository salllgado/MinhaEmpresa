//
//  NoteListTableViewCell.swift
//  Feature
//
//  Created by Chrystian Salgado on 27/07/19.
//  Copyright © 2019 Salgado's Production. All rights reserved.
//

import UIKit

protocol NoteListTableViewCellDelegate: class {
    func actionSelected()
}

class NoteListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblEnterpriseName: UILabel!
    @IBOutlet weak var lblNoteValue: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    
    weak var delegate: NoteListTableViewCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(_ receipt: Receipt) {
        self.lblEnterpriseName.text = receipt.enterpriseName
        self.lblNoteValue.text = receipt.value
        self.lblDate.text = receipt.date
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        lblEnterpriseName.text = ""
        lblNoteValue.text = ""
        lblDate.text = ""
    }
    
    @IBAction func actionTappep(_ sender: Any) {
        delegate?.actionSelected()
    }
}
