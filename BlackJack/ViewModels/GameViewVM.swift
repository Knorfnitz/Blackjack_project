//
//  GameViewVM.swift
//  BlackJack
//
//  Created by Alexander Hasecke on 03.12.24.
//

import Foundation

class GameViewVM: ObservableObject {
    @Published var player = Player(name: "", gameHistory: [], coins: 0, email: "", password: "")
    @Published var deck: Deck = Deck(success: true, deckId: "", shuffled: true, remaining: 52)
    @Published var dealerCards: [Card] = []
    @Published var playerCards: [Card] = []
    @Published var isGameActive: Bool = true
     
    
    
    func addPlayer() {
        //neuen Spieler erstellen/registrieren
    }
    
    func checkPW() {
        //passwort/mail checken
    }
    func checkMultipleUser() {
        //schauen ob die Mail schon vorhanden ist
    }
}
