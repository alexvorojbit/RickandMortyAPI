//
//  Section.swift
//  RickandMortyAPI
//
//  Created by Alexandru Vorojbit on 9/3/21.
//

import Foundation

// TODO: Split those structures into separates files within a "Models" foler

struct Response: Decodable, Hashable {
    let results: [CharacterResults]
}

// TODO: Use the simplest names you can, `Character` would have been great here.
struct CharacterResults: Decodable, Hashable {
    let name: String
    let location: Location
    let image: String
//    let episode: [URL]
}

struct Location: Decodable, Hashable {
    let name: String
}

//struct Episode: Decodable, Hashable {
//  let name: String
//}
