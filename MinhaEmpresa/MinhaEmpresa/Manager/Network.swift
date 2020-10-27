//
//  Network.swift
//  NetworkKit
//
//  Created by Chrystian Salgado on 04/08/19.
//  Copyright © 2019 Salgado's Production. All rights reserved.
//

import Foundation

enum HTTPMethod: String {
    case GET
    case POST
}

enum Credentials {
    static var accessToken = "YOUR_ACCESS_TOKEN"
}

class ServiceProvider {
    
    private var session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func request<T: Decodable>(target: ServiceTargetProtocol, completion: @escaping (Result<T, NetworkError>) -> Void) {
        guard let url = target.baseURL?.appendingPathComponent(target.path) else {
            completion(.failure(.badURL))
            return
        }
        
        guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            completion(.failure(.badURL))
            return
        }
        
        urlComponents.queryItems = target.parameters.map({ URLQueryItem(name: $0.key, value: $0.value) })
        
        guard let componentURL = urlComponents.url else {
            completion(.failure(.badURL))
            return
        }
        
        let urlRequest = URLRequest(url: componentURL)
        let session = self.session.dataTask(with: urlRequest) { (data, response, error) in
            self.debugResponse(request: urlRequest, data: data)
            if let error = error {
                completion(.failure(.connectionFailure(error)))
            } else {
                guard let data = data else {
                    completion(.failure(.noData))
                    return
                }
                
                do {
                    let decoded = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(decoded))
                } catch(let error) {
                    completion(.failure(.parseError(error)))
                }
            }
        }
        
        session.resume()
    }
    
    private lazy var auth: String = {
        let auth = "Bearer \(Credentials.accessToken)"
        return auth
    }()
    
    private func debugResponse(request: URLRequest, data: Data?) {
        print("==== REQUEST ====")
        print("\nURL: \(request.url?.absoluteString ?? "")")
        
        if let requestHeader = request.allHTTPHeaderFields {
            if let data = try? JSONSerialization.data(withJSONObject: requestHeader, options: .prettyPrinted) {
                print("\nHEADER: \(String(data: data, encoding: .utf8) ?? "")")
            }
        }
        
        print("\nMETHOD: \(request.httpMethod ?? "")")
        
        print("\n==== RESPONSE ====")
        if let data = data {
            if let jsonObject = try? JSONSerialization.jsonObject(with: data) {
                if let jsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) {
                    print(String(data: jsonData, encoding: .utf8) ?? "")
                }
            }
        }
        print("\n================\n")
    }
}
