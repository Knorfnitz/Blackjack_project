//
//  ApiCalls.swift
//  BlackJack
//
//  Created by Alexander Hasecke on 03.12.24.
//
import SwiftUI

class CardsRepository {
    
    func getDeckFromAPI() async throws -> Deck? {
        let urlString = "https://api.syntax-institut.de/quotes?language=DE"
        
        guard let url = URL(string: urlString) else {
            throw HTTPError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let result = try JSONDecoder().decode(Deck.self, from: data)

        return result
    }
    
    func getDrawFromAPI() async throws {
      
    }
    
    func getCardFromAPI() async throws {
      
    }
}
