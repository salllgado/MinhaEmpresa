//
//  Enterprise.swift
//  MinhaEmpresa
//
//  Created by Chrystian Salgado on 06/07/19.
//  Copyright © 2019 Salgado's Production. All rights reserved.
//

import Foundation

struct Enterprise {
    
    var status: String? = ""
    var message: String? = ""
    var cnpj: String = ""
    var type: String = ""
    var fondationDate: String = ""
    var enterpriseName: String = ""
    var nickname: String = ""
    //    let fistActivity: [String] = []
    //    let cnaeCode:
//    var cnaeDescription: String = ""
//    var secondaryActivity: String = ""
    var enterprisePlace: String = ""
    var number: String = ""
    var complement: String = ""
    var adressCode: String = ""
    var neighborhood: String = ""
    var city: String = ""
    var uf: String = ""
    
    enum CodingKeys: String, CodingKey {
        case status
        case message = "message"
        case cnpj
        case type = "tipo"
        case fondationDate = "abertura"
        case enterpriseName = "nome"
        case nickname = "fantasia"
        case fistActivity = "atividade_principal"
//        case cnaeCode = "atividade_principal.code"
//        case caneDescription = "atividade_principal.text"
//        case secondaryActivity = "atividades_secundarias"
        case enterprisePlace = "logradouro"
        case number = "numero"
        case complement = "complemento"
        case adressCode = "cep"
        case neighborhood = "bairro"
        case city = "municipio"
        case uf
    }
}

extension Enterprise: Decodable {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        cnpj = try values.decode(String.self, forKey: .cnpj)
        type = try values.decode(String.self, forKey: .type)
        fondationDate = try values.decode(String.self, forKey: .fondationDate)
        enterpriseName = try values.decode(String.self, forKey: .enterpriseName)
        nickname = try values.decode(String.self, forKey: .nickname)
//        fistActivity = try values.decode(String.self, forKey: .fistActivity)
//        cnaeCode = try values.decode(String.self, forKey: .cnaeCode)
//        cnaeDescription = try values.decode(String.self, forKey: .cnaeDescription)
//        secondaryActivity = try values.decode(String.self, forKey: .secondaryActivity)
        enterprisePlace = try values.decode(String.self, forKey: .enterprisePlace)
        number = try values.decode(String.self, forKey: .number)
        complement = try values.decode(String.self, forKey: .complement)
        adressCode = try values.decode(String.self, forKey: .adressCode)
        neighborhood = try values.decode(String.self, forKey: .neighborhood)
        city = try values.decode(String.self, forKey: .city)
        uf = try values.decode(String.self, forKey: .uf)
    }
}
