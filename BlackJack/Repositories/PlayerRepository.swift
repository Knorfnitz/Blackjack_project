//
//  PlayerRepository.swift
//  BlackJack
//
//  Created by Alexander Hasecke on 05.12.24.
//


import SwiftData
import SwiftUI

class PlayerRepository {
     let context: ModelContext
    
    init(context: ModelContext) {
        self.context = context
    }
    
    // Spieler erstellen
    func createPlayer(name: String, coins: Int, profileImagePath: String?, email: String, password: String) {
        let newPlayer = Player(name: name, coins: coins, profileImagePath: profileImagePath, email: email, password: password)
        context.insert(newPlayer)
        try? context.save() // Änderungen speichern
    }
    
    // Spieler löschen
    func deletePlayer(player: Player) {
        context.delete(player)
        try? context.save()
    }
    
    func findPlayerBy(email: String, password: String) -> Player? {
            let fetchDescriptor = FetchDescriptor<Player>(predicate: #Predicate { player in
                player.email == email && player.password == password
            })
            return try? context.fetch(fetchDescriptor).first
        }
    
    func findPlayerByMail(email: String) -> Player? {
            let fetchDescriptor = FetchDescriptor<Player>(predicate: #Predicate { player in
                player.email == email
            })
            return try? context.fetch(fetchDescriptor).first
        }
}
