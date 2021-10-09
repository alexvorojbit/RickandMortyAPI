//
//  Character.swift
//  RickandMortyAPI
//
//  Created by Alexandru Vorojbit on 20.09.2021.
//

import Foundation

struct Character: Decodable, Hashable {
    let name: String
    let location: Location
    let image: String
//    let episode: URL
    let status: String?
}

struct Location: Decodable, Hashable {
    let name: String
}
