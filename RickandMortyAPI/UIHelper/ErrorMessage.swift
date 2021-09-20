//
//  ErrorMessage.swift
//  RickandMortyAPI
//
//  Created by Alexandru Vorojbit on 9/4/21.
//

import Foundation

enum ErrorMessage: String, Error {
    case unableToDownload   = "Unable to download the data. Please check your internet connection."
    case invalidResponse    = "Invalid response from the server. Please try again."
    case invalidData        = "The data received from the server was invalid. Please try again."
}
