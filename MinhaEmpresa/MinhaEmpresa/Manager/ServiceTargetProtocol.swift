//
//  ServiceTargetProtocol.swift
//  MinhaEmpresa
//
//  Created by Chrystian on 26/10/20.
//  Copyright © 2020 Chrystian Salgado. All rights reserved.
//

import Foundation

protocol ServiceTargetProtocol {
    var baseURL: URL? { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: [String: String] { get }
}

