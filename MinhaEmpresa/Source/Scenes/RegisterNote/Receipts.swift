//
//  Receipts.swift
//  Feature
//
//  Created by Chrystian Salgado on 07/09/19.
//  Copyright © 2019 Salgado's Production. All rights reserved.
//

import Foundation

struct Receipts: Decodable {
    var CNPJ: [Receipt]
}

struct Receipt: Codable {
    var noteOwner: String
    var cnpj: String
    var enterpriseName: String
    var value: String
    var date: String
    var paymentDate: String?
    
    init(cnpj: String, enterpriseName: String, value: String, date: String, paymentDate: String?) {
        self.noteOwner = KeychainWorker().getEnterpriseId()
        self.cnpj = cnpj
        self.enterpriseName = enterpriseName
        self.value = value
        self.date = date
        self.paymentDate = paymentDate
    }
}
