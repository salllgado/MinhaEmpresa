//
//  NetworkError.swift
//  MinhaEmpresa
//
//  Created by Chrystian on 26/10/20.
//  Copyright © 2020 Chrystian Salgado. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case connectionFailure(Error)
    case noData
    case parseError(Error)
}
