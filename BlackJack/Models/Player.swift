//
//  Player.swift
//  BlackJack
//
//  Created by 🅰️ppEntwickler  on 02.12.24.
//

//import Foundation
import SwiftUI
import SwiftData

@Model
class Player {
   //@Attribute(.unique) var playerId: UUID = UUID() // Eindeutige ID
    @Attribute(.unique) var id: UUID = UUID()
    var name: String
    var coins: Int
    var profileImagePath: String? // Pfad für das Profilbild
    var email: String
    var password: String
   

    // Initialisierer
    init(name: String, coins: Int, profileImagePath: String? = nil, email: String, password: String) {
        self.name = name
        self.coins = coins
        self.profileImagePath = profileImagePath
        self.email = email
        self.password = password

    }
}
