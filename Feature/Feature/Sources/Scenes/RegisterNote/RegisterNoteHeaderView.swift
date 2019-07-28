//
//  RegisterNoteHeaderView.swift
//  Feature
//
//  Created by Chrystian Salgado on 28/07/19.
//  Copyright © 2019 Salgado's Production. All rights reserved.
//

import UIKit

protocol ResgisterNoteHeaderViewDelegate: class {
    func actionNewNote()
}

class RegisterNoteHeaderView: UIView {
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var btnCustom: UIButton!
    
    var delegate: ResgisterNoteHeaderViewDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    private func setup() {
        Bundle(for: RegisterNoteHeaderView.self).loadNibNamed("RegistrationButton", owner: self, options: nil)
        addSubview(headerView)
        headerView.frame = self.bounds
        headerView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    @IBAction func actionButton(_ sender: Any) {
        delegate?.actionNewNote()
    }
}
