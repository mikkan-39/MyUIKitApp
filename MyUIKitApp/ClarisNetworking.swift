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
        print("login request")
        var request = URLRequest(url: URL(string: "https://api.claris.su/main/token")!)
        request.httpMethod = "POST"
        request.httpBody = "grant_type=password&username=\(username)&password=\(password)".data(using: .utf8)
        
        let task = urlSession.dataTask(
            with: request,
            completionHandler: { data, response, error in
                
                guard let data = data else {
                    handler(.failure(error!))
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let product = try decoder.decode(AccessTokenResponse.self, from: data)
                    print("Success! Token: \(product.access_token)")
                    handler(.success(product))
                } catch {
                    handler(.failure(error))
                }
            }
        )
        task.resume()
    }
    
    func getDefaultTickets (
    then handler: @escaping (Result<[Ticket], Error>) -> Void
    ) {
        print("getTickets request")
        var request = defaultRequest!
        request.url = URL(string: "https://api.claris.su/main/vNext/v1/requests?view=mobile&orderBy=number+desc")!
        
        guard let token = self.accessToken else {
            //TODO: enum token error
            print("token error")
            return
        }
        
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        let task = urlSession.dataTask(
            with: request,
            completionHandler: { data, response, error in
                
                guard let data = data else {
                    handler(.failure(error!))
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let product = try decoder.decode([Ticket].self, from: data)
                    handler(.success(product))
                } catch {
                    handler(.failure(error))
                }
            }
        )
        task.resume()
    }
}
