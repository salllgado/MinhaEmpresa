//
//  CanSaveToDisk.swift
//  MinhaEmpresa
//
//  Created by Chrystian Salgado on 11/01/20.
//  Copyright © 2020 Chrystian Salgado. All rights reserved.
//

import Foundation

/// Objects conforming to `CanSaveToDisk` have a save method and provide keys for saving individual objects or a list of objects.
protocol CanSaveToDisk: Codable {
    
    /// Provide default logic for encoding this value.
    static var defaultEncoder: JSONEncoder { get }
    
    /// This key is used to save the individual object to disk. This works best by using a unique identifier.
    var storageKeyForObject: String { get }
    
    /// Persists the object to disk.
    ///
    /// - Throws: useful to throw an error from an encoder or a custom error if you use stage different from user defaults like the keychain
    func save() throws
    
    func load() throws -> Enterprise?
}
