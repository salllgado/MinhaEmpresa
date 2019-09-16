//
//  Receipts.swift
//  Feature
//
//  Created by Chrystian Salgado on 07/09/19.
//  Copyright © 2019 Salgado's Production. All rights reserved.
//

import Foundation
import CoreData
//
//struct Receipts: Decodable {
//    var CNPJ: [Receipt]
//}
//

final class Receipt: NSManagedObject {
    
    @NSManaged var noteOwner: String
    @NSManaged var cnpj: String
    @NSManaged var enterpriseName: String
    @NSManaged var value: String
    @NSManaged var date: String
    @NSManaged var paymentDate: String?
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Receipt> {
           return NSFetchRequest<Receipt>(entityName: String(describing: self))
       }
       
       convenience init() {
           let entityDescription: NSEntityDescription = CoreDataHelper.shared.create(String(describing: type(of: self)))
           self.init(entity: entityDescription, insertInto: nil)
       }

//    init(cnpj: String, enterpriseName: String, value: String, date: String, paymentDate: String?) {
//        self.noteOwner = KeychainWorker().getEnterpriseId()
//        self.cnpj = cnpj
//        self.enterpriseName = enterpriseName
//        self.value = value
//        self.date = date
//        self.paymentDate = paymentDate
//    }
}
