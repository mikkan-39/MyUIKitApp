//
//  Networking.swift
//  MyUIKitApp
//
//  Created by Mikkan Artian on 27.04.2022.
//

import Foundation

struct ClarisNetworking {
    var urlSession = URLSession.shared
    var accessToken: String?
    var defaultRequest: URLRequest?
    var url: URL?
    
    mutating func SetURL (_ url: URL) {
            self.url = url
            self.defaultRequest = URLRequest(url: url)
            print("Set URL: \(String(describing: url))")
        }
    
    
    // Get the access token
    mutating func LoginRequest (
        username: String,
        password: String,
        then handler: @escaping (Result<AccessTokenResponse, Error>) -> Void
    ) {
        var request = URLRequest(url: URL(string: "https://api.claris.su/main/token")!)
        request.httpMethod = "POST"
        request.httpBody = "grant_type=password&username=\(username)&password=\(password)".data(using: .utf8)
        
        let task = urlSession.dataTask(
            with: request,
            completionHandler: { data, response, error in
                print("Response: \(String(describing: response))")
                print("Data: \(String(describing: data))")
                print("Error: \(String(describing: error))")
                
                guard let data = data else {
                    handler(.failure(error!))
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let product = try decoder.decode(AccessTokenResponse.self, from: data)
                    handler(.success(product))
                } catch {
                    handler(.failure(error))
                }
            }
        )
        task.resume()
    }
}
