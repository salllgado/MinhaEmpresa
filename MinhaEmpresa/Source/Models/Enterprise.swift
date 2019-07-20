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
    var firstActivity: [Detail] = []
    var secondaryActivity: [Detail] = []
    var enterprisePlace: String = ""
    var number: String = ""
    var complement: String = ""
    var adressCode: String = ""
    var neighborhood: String = ""
    var city: String = ""
    var uf: String = ""
    var socios: [Socios] = []
    
    enum CodingKeys: String, CodingKey {
        case status
        case message = "message"
        case cnpj
        case type = "tipo"
        case fondationDate = "abertura"
        case enterpriseName = "nome"
        case nickname = "fantasia"
        case fistActivity = "atividade_principal"
        case socios = "qsa"
        case secondaryActivity = "atividades_secundarias"
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
        firstActivity = try values.decode([Detail].self, forKey: .fistActivity)
        socios = try values.decode([Socios].self, forKey: .socios)
        secondaryActivity = try values.decode([Detail].self, forKey: .secondaryActivity)
        enterprisePlace = try values.decode(String.self, forKey: .enterprisePlace)
        number = try values.decode(String.self, forKey: .number)
        complement = try values.decode(String.self, forKey: .complement)
        adressCode = try values.decode(String.self, forKey: .adressCode)
        neighborhood = try values.decode(String.self, forKey: .neighborhood)
        city = try values.decode(String.self, forKey: .city)
        uf = try values.decode(String.self, forKey: .uf)
    }
}

struct Detail: Decodable {
    var text: String = ""
    var code: String = ""
}

struct Socios: Decodable {
    var tipo: String
    var nome: String
    
    enum CodingKeys: String, CodingKey {
        case tipo = "qual"
        case nome
    }
}
