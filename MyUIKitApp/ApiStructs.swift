//
//  Ticket.swift
//  MyUIKitApp
//
//  Created by Mikkan Artian on 27.04.2022.
//

struct GenericIDField: Codable {
    let id: Int
    let name: String
}

struct Ticket: Codable {
    let id: Int
    let status: GenericIDField
    let author: GenericIDField
    let type: GenericIDField
}

struct TicketListResponse: Codable {
    let tickets: [Ticket]
}

struct AccessTokenResponse: Codable {
    let access_token: String
}
