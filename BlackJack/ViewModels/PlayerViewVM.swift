//
//  PlayerViewVM.swift
//  BlackJack
//
//  Created by Alexander Hasecke on 03.12.24.
//

import Foundation

class PlayerViewVM: ObservableObject {
    @Published var player: Player = Player(name: "", gameHistory: [], coins: 0, email: "", password: "")
    
   
    
    
    func createPlayer() {
        //neue Player Instanz erstellen
    }
    
    func addPlayerToPlayerList() {
        //player Instanz zu PlayerList hinzufügen
    }
    func checkUsername() {
        //schauen ob der Username schon vergeben ist
    }
}
