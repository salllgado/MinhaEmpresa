//
//  Enterprise.swift
//  NetworkKit
//
//  Created by Chrystian Salgado on 04/08/19.
//  Copyright © 2019 Salgado's Production. All rights reserved.
//

import Foundation

public struct Enterprise {
    public var status: String? = ""
    public var message: String? = ""
    public var cnpj: String = ""
    public var type: String = ""
    public var fondationDate: String = ""
    public var enterpriseName: String = ""
    public var nickname: String = ""
    public var firstActivity: [Detail] = []
    public var secondaryActivity: [Detail] = []
    public var enterprisePlace: String = ""
    public var number: String = ""
    public var complement: String = ""
    public var adressCode: String = ""
    public var neighborhood: String = ""
    public var city: String = ""
    public var uf: String = ""
    public var socios: [Socios] = []
    
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
    public init(from decoder: Decoder) throws {
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

public struct Detail: Decodable {
    public var text: String = ""
    public var code: String = ""
}

public struct Socios: Decodable {
    public var tipo: String
    public var nome: String
    
    enum CodingKeys: String, CodingKey {
        case tipo = "qual"
        case nome
    }
}

extension Enterprise {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(status, forKey: .status)
        try container.encode(message, forKey: .message)
        try container.encode(cnpj, forKey: .cnpj)
        try container.encode(type, forKey: .type)
        try container.encode(fondationDate, forKey: .fondationDate)
        try container.encode(enterpriseName, forKey: .enterpriseName)
        try container.encode(nickname, forKey: .nickname)
        try container.encode(firstActivity, forKey: .fistActivity)
        try container.encode(socios, forKey: .socios)
        try container.encode(secondaryActivity, forKey: .secondaryActivity)
        try container.encode(enterprisePlace, forKey: .enterprisePlace)
        try container.encode(number, forKey: .number)
        try container.encode(complement, forKey: .complement)
        try container.encode(adressCode, forKey: .adressCode)
        try container.encode(neighborhood, forKey: .neighborhood)
        try container.encode(city, forKey: .city)
        try container.encode(uf, forKey: .uf)
    }
}

extension Detail: Encodable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(text, forKey: .text)
        try container.encode(code, forKey: .code)
    }
}

extension Socios: Encodable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(tipo, forKey: .tipo)
        try container.encode(nome, forKey: .nome)
    }
}

extension Enterprise: CanSaveToDisk {
    
    static var defaultEncoder: JSONEncoder {
        let encoder = JSONEncoder()

        return encoder
    }
    
    var storageKeyForObject: String {
        return UserDefaultsKeys.enterprise.rawValue
    }
    
    func save() throws {
        let data = try Enterprise.defaultEncoder.encode(self)
        let storage = UserDefaults.standard
        storage.setValue(data, forKey: storageKeyForObject)
    }
    
    func load() throws -> Enterprise? {
        let storage = UserDefaults.standard
        guard let value = storage.value(forKey: storageKeyForObject) as? Data else { return nil }
        do {
            return try JSONDecoder().decode(Enterprise.self, from: value)
        } catch {
            return nil
        }
    }
}
