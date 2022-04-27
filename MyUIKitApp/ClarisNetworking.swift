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
        password: String
//        then handler: @escaping (Result<Data, Error>) -> Void
    ) {
        guard var request = defaultRequest else {
            print("Failed to create the request template. Check if the URL was provided")
            return
        }
        
        request.httpBody = "/login/grant_type=password&username=\(username)&password=\(password)".data(using: .utf8)
        
        let task = urlSession.dataTask(
            with: request,
            completionHandler: { data, response, error in
                // Validate response and call handler
                print("Response: \(String(describing: response))")
                print("Data: \(String(describing: data))")
                print("Error: \(String(describing: error))")
//                if let data = data {
//                    handler(.success(data))
//                } else {
//                    handler(.failure(error!))
//                }
            }
        )
        task.resume()
    }
}

