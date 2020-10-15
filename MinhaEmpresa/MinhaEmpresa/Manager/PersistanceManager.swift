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
    
    func saveFavorite(_ favorite: Favorite) {
        let modelName = "FavoriteEnterprise"
        guard let context = context else { return }
        guard let consumeEntity = NSEntityDescription.entity(forEntityName: modelName, in: context) else { return }
        let favoriteObject = NSManagedObject(entity: consumeEntity, insertInto: context)
        
        favoriteObject.setValue(favorite.cnpj, forKey: Favorite.PersistenceKey.cnpj.rawValue)
        favoriteObject.setValue(favorite.name, forKey: Favorite.PersistenceKey.name.rawValue)
        
        do {
            try context.save()
            debugPrint("success saving object")
        } catch {
            debugPrint("error when system trying save object")
        }
    }
    
    func saveFavoriteIfNeeded(_ favorite: Favorite) {
        let favoriteList = self.fetchFavorites()
        let list = favoriteList.filter { (favorite) -> Bool in
            favorite.cnpj == favorite.cnpj
        }
        
        if list.isEmpty {
            saveFavorite(favorite)
        } else {
            print("Objeto já foi salvo")
        }
    }
}
