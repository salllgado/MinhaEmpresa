//
//  PersistanceManager.swift
//  MinhaEmpresa
//
//  Created by Chrystian on 29/06/20.
//  Copyright © 2020 Chrystian Salgado. All rights reserved.
//

import Foundation
import UIKit
import CoreData

struct Favorite: Identifiable {
    let id: UUID
    let cnpj: String
    let name: String
    
    init(cnpj: String, name: String) {
        self.id = UUID()
        self.cnpj = cnpj
        self.name = name
    }
}

extension Favorite {
    
    enum PersistenceKey: String {
        case cnpj
        case name
    }
}


struct PersistenceManager {
    
    var appDelegate: AppDelegate?
    var context: NSManagedObjectContext?
    var coordinator: NSPersistentStoreCoordinator?
    
    static let shared = PersistenceManager()
    
    init() {
        appDelegate = UIApplication.shared.delegate as? AppDelegate
        coordinator = appDelegate?.persistentStoreCoordinator
        context = appDelegate?.managedObjectContext
    }
    
    func fetchFavorites() -> [Favorite] {
        let modelName = "FavoriteEnterprise"
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: modelName)
        guard let context = context else { return [] }
        var favorites = [Favorite]()
        guard let entity = NSEntityDescription.entity(forEntityName: modelName, in: context) else { return [] }
        
        fetchRequest.entity = entity
        
        do {
            let items = try context.fetch(fetchRequest)
            
            for item in (items as? [NSManagedObject]) ?? [] {
                if let cnpj = item.value(forKey: Favorite.PersistenceKey.cnpj.rawValue) as? String,
                    let name = item.value(forKey: Favorite.PersistenceKey.name.rawValue) as? String {
                    favorites.append(Favorite(cnpj: cnpj, name: name))
                }
                
            }
        } catch {
            debugPrint("error")
            return favorites
        }
        
        return favorites
    }
}
