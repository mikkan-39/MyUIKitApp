//
//  Middleware.swift
//  MyUIKitApp
//
//  Created by Mikkan Artian on 28.04.2022.
//

import Foundation

func LoginAndGetTickets(username: String, password: String) -> [Ticket] {
    guard let url = URL(string: "https://api.claris.su/main/vNext/v1/") else {
        print("Failed to create URL")
        return []
    }
    
    var api = ClarisNetworking()
    api.SetURL(url)
    api.LoginRequest(username: username, password: password) { result in
        switch result {
        case .success(let data):
            api.accessToken = data.access_token
            print(String(describing: api))
        default:
            print("Login Error")
        }
    }
    
    return []
}
