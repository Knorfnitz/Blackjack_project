//
//  GameViewVM.swift
//  BlackJack
//
//  Created by Alexander Hasecke on 03.12.24.
//

import Foundation

class GameViewVM: ObservableObject {
    @Published var player = Player(name: "Player 1", gameHistory: [], coins: 1000, email: "", password: "")
    @Published var deck: Deck = Deck(success: true, deck_id: "", shuffled: true, remaining: 52)
    @Published var dealerCards: [Card] = []
    @Published var playerCards: [Card] = []
    @Published var isGameActive: Bool = false
    @Published var draw: Draw = Draw(success: true, deck_id: "", cards: [], remaining: 0)
     
    private let repository: CardsRepository
    init(repository: CardsRepository) {
        self.repository = repository
    }
    
    
    func getDeck() async {
          do {
              let deck = try await repository.getDeckFromAPI()
              self.deck = deck
          } catch {
              print("Error loading deck: \(error)")
          }
      }

    
    func drawCardFromDeck(deckid: String, amountOfDrawingCards: Int) async {
          do {
              let drawnCard = try await repository.getDrawFromAPI(deckId: deckid, amountOfDrawingCards: amountOfDrawingCards)
              self.draw = drawnCard
          } catch {
              print("Cant draw card: \(error)")
          }
      }
    func checkMultipleUser() {
        //schauen ob die Mail schon vorhanden ist
    }
}
