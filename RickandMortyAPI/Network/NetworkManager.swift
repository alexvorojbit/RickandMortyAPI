//
//  NetworkManager.swift
//  RickandMortyAPI
//
//  Created by Alexandru Vorojbit on 9/4/21.
//

import UIKit

class NetworkManager {
    
    static let shared   = NetworkManager()
    private let characterURL = "https://rickandmortyapi.com/api/character"
    private let episodeURL = "https://rickandmortyapi.com/api/episode"
    let cache           = NSCache<NSString, UIImage>()


    func getElements<Element: Codable>(from endpoint: URL, completion: @escaping (Result<[Element], ErrorMessage>) -> Void) {
        
        URLSession.shared.dataTask(with: endpoint) { (data, response, error) in
            if let _ = error {
                completion(.failure(.unableToDownload))
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            guard let data = data else {
                completion(.failure(.invalidData))
                print("data")
                return
            }
            do {
                let decoder = JSONDecoder()
                let results = try decoder.decode([Element].self, from: data)
                completion(.success(results))
                print(results)
            } catch {
                completion(.failure(.invalidData))
                print("Failed to decode")
            }
            
        }.resume()
    }

    // TODO: Refactor this to use the `getElements` function above.
    func getCharactersCVCData(completion: @escaping (Result<Response, ErrorMessage>) -> Void) {
        guard let url = URL(string: characterURL) else {
            completion(.failure(.unableToDownload))
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let _ = error {
                completion(.failure(.unableToDownload))
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            guard let data = data else {
                completion(.failure(.invalidData))
                print("data")
                return
            }
            do {
                let decoder = JSONDecoder()
                let results = try decoder.decode(Response.self, from: data)
                completion(.success(results))
                print(results)
            } catch {
                completion(.failure(.invalidData))
                print("Failed to decode")
            }
            
        }.resume()
    }
    
//    func loadEpisode(for character: CharacterResults, completion: @escaping (Result<[Episode], ErrorMessage>) -> Void) {
//        guard let url = URL(string: episodeURL) else {
//            completion(.failure(.unableToDownload))
//            return
//        }
//        URLSession.shared.dataTask(with: url) { (data, response, error) in
//            if let _ = error {
//                completion(.failure(.unableToDownload))
//                return
//            }
//            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
//                completion(.failure(.invalidResponse))
//                return
//            }
//            guard let data = data else {
//                completion(.failure(.invalidData))
//                print("data")
//                return
//            }
//            do {
//                let decoder = JSONDecoder()
//                let response = try decoder.decode([Episode].self, from: data)
//                completion(.success(response))
//                print(response)
//            } catch {
//                completion(.failure(.invalidData))
//                print("Failed to decode")
//            }
//            
//        }.resume()
//    }
}
