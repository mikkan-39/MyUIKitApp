//
//  Ticket.swift
//  MyUIKitApp
//
//  Created by Mikkan Artian on 27.04.2022.
//

struct GenericIDField: Codable {
    let id: String
    let name: String?
}

struct Ticket: Codable {
    let number: Int
    let author: GenericIDField
}

struct AccessTokenResponse: Codable {
    let access_token: String
}
