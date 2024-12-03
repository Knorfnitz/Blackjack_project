//
//  PlayerListViewVM.swift
//  BlackJack
//
//  Created by Alexander Hasecke on 03.12.24.
//

import Foundation

@MainActor

class PlayerListViewVM: ObservableObject {
    @Published var playerList: PlayerList = PlayerList()
    
    
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
