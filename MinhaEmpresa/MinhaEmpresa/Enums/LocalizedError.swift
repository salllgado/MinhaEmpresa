//
//  LocalizedError.swift
//  MinhaEmpresa
//
//  Created by Chrystian on 14/10/20.
//  Copyright © 2020 Chrystian Salgado. All rights reserved.
//

import Foundation

enum LocalizedError {
    case networkError
    case parseError
    case unknown

    var prettyError: String {
        switch self {
        case .networkError:
            return "Houve um problema com a conecção tente novamente mais tarde"
        case .parseError:
            return "Houve um problema ao recuperar os dados."
        case .unknown:
            return "Erro desconhecido"
        }
    }
}
