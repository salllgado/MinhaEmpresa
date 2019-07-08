//
//  Endpoint.swift
//  MinhaEmpresa
//
//  Created by Chrystian Salgado on 06/07/19.
//  Copyright © 2019 Salgado's Production. All rights reserved.
//

import Foundation

/*
 https://stackoverflow.com/questions/3968919/how-can-i-access-a-user-defined-xcode-build-setting
 */
let host = Bundle.main.infoDictionary?["AppHost"] as? String ?? ""
let httpProtocol = Bundle.main.infoDictionary?["HttpProtocol"] as? String ?? ""

///Enum of available endpoints.
enum Endpoint: String {
    case enterpriseData = "/v1/cnpj"
}
