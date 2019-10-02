//
//  NoteFinderTableViewCell.swift
//  MinhaEmpresa
//
//  Created by Chrystian Salgado on 01/10/19.
//  Copyright © 2019 Salgado's Production. All rights reserved.
//

import UIKit
import NetworkKit

protocol NoteFinderTableViewCellDelegate: class {
    func actionSelected(_ enterprise: Enterprise)
}

class NoteFinderTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var lblEnterpriseName: UILabel!
    @IBOutlet private weak var lblCNPJ: UILabel!
    @IBOutlet private weak var lblFantasyName: UILabel!
    
    weak var delegate: NoteFinderTableViewCellDelegate?
    private var enterprise: Enterprise?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        lblEnterpriseName.text = ""
        lblCNPJ.text = ""
        lblFantasyName.text = ""
    }
    
    func configure(_ enterprise: Enterprise) {
        self.enterprise = enterprise
        lblEnterpriseName.text = enterprise.enterpriseName
        lblCNPJ.text = enterprise.cnpj
        lblFantasyName.text = enterprise.nickname
    }
    
    @IBAction func actionTappep(_ sender: Any) {
        guard let _enterprise = enterprise else { return }
        delegate?.actionSelected(_enterprise)
    }
}
