//
//  Venue.swift
//  NavigationDrwer
//
//  Created by Shivanand Koli on 04/04/26.
//

import Foundation

struct VenueResponse: Codable {
    let response: InnerResponse
}

struct InnerResponse: Codable {
    let venues: [Venue]
}

struct Venue: Codable, Identifiable {
    let id: String
    let name: String
    let location: Location?
}

struct Location: Codable {
    let city: String?
    let state: String?
}
