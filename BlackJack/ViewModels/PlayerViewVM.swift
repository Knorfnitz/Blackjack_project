//
//  PlayerViewVM.swift
//  BlackJack
//
//  Created by Alexander Hasecke on 03.12.24.
// 04.12.2024 Bearbeitet Von @Tonytaor

import Foundation

class PlayerViewVM: ObservableObject {
    @Published var player: Player = Player(name: "Player 1", gameHistory: [], coins: 1000, email: "", password: "")
    @Published var playerList: [Player] = [] // Liste für alle Spieler
    
    func createPlayer(name: String, email: String, password: String) {
        // Eine neue Player-Instanz erstellen und die bestehende `player` ersetzen
        self.player = Player(name: name, gameHistory: [], coins: 1000, email: email, password: password)
    }
    
    func addPlayerToPlayerList() {
        // Die aktuelle Player-Instanz zur `playerList` hinzufügen
        if !playerList.contains(where: { $0.email == player.email }) { // Duplikate vermeiden
            playerList.append(player)
        } else {
            print("Spieler mit dieser E-Mail existiert bereits.")
        }
    }
    
    func checkUsername(name: String) -> Bool {
        // Überprüfen, ob der Name bereits vergeben ist
        return playerList.contains { $0.name == name }
    }
}
