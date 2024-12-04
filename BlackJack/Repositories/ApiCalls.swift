//
//  ApiCalls.swift
//  BlackJack
//
//  Created by Alexander Hasecke on 03.12.24.
//
import SwiftUI

class CardsRepository {
    
    func getDeckFromAPI() async throws -> Deck {
        let urlString = "https://www.deckofcardsapi.com/api/deck/new/shuffle/?deck_count=1"
        
        guard let url = URL(string: urlString) else {
            throw HTTPError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let result = try JSONDecoder().decode(Deck.self, from: data)

        return result
    }
    
    func getDrawFromAPI(deckId: String, amountOfDrawingCards: Int) async throws -> Draw {
     //   let amountOfDrawingCardsString = String(amountOfDrawingCards)
        let urlString = "https://www.deckofcardsapi.com/api/deck/\(deckId)/draw/?count=1"
        
        guard let url = URL(string: urlString) else {
            throw HTTPError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let result = try JSONDecoder().decode(Draw.self, from: data)

        return result
    }
    
   
}
