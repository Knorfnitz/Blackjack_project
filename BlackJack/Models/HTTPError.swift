//
//  HTTPError.swift
//  BlackJack
//
//  Created by Alexander Hasecke on 03.12.24.
//

enum HTTPError: Error {
    case invalidURL, fetchFailed
    
    var message: String {
        switch self {
        case .invalidURL: "Die URL ist ungültig"
        case .fetchFailed: "Laden ist fehlgeschlagen"
        }
    }
}
