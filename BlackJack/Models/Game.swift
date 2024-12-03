//
//  Game.swift
//  BlackJack
//
//  Created by 🅰️ppEntwickler  on 02.12.24.
//

import Foundation

struct Game {
    
    var gameId: UUID = UUID()
    var bet: Int
    var player: Player
    var dealerCards: [Card]
    var playerCards: [Card]
    var oldCoinAmount: Int
    var newCoinAmount: Int
    var isGameActive: Bool
    
}
