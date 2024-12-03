//
//  Player.swift
//  BlackJack
//
//  Created by 🅰️ppEntwickler  on 02.12.24.
//

//import Foundation
import SwiftUI

struct Player {
    
    var playerId: UUID = UUID()
    var name: String
    var gameHistory: [Game]
    var coins: Int
    var profileImage: Image?
    var email: String
    var password: String
    
}
