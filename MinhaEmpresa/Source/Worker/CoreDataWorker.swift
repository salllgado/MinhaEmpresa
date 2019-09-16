//
//  CoreDataWorker.swift
//  MinhaEmpresa
//
//  Created by Chrystian Salgado on 15/09/19.
//  Copyright © 2019 Salgado's Production. All rights reserved.
//

import Foundation
import CoreData

protocol CoreDataWorkable {
    func fetch() throws -> [Receipt]
    func create(_ receipt: Receipt) throws
    func delete(_ receipt: Receipt) throws
}

final class CoreDataWorker: CoreDataWorkable {
    
    func fetch() throws -> [Receipt] {
        do {
            let request: NSFetchRequest<Receipt> = Receipt.fetchRequest()
            return try CoreDataHelper.shared.fetch(request)
        } catch {
            Logger.log(error.localizedDescription)
            return []
        }
    }
    
    func create(_ receipt: Receipt) throws {
        do {
            try CoreDataHelper.shared.insert(receipt)
        } catch {
            Logger.log(error.localizedDescription)
        }
    }
    
    func delete(_ receipt: Receipt) throws {
        do {
            try CoreDataHelper.shared.delete(receipt)
        } catch {
            Logger.log(error.localizedDescription)
        }
    }
}
