//
//  PlayerViewVM.swift
//  BlackJack
//
//  Created by Alexander Hasecke on 03.12.24.
// 04.12.2024 Bearbeitet Von @Tonytaor

import SwiftUI

class PlayerViewVM: ObservableObject {
    
    let playerRepository: PlayerRepository
    

    @Published var name: String = ""
    @Published var coins: Int = 1000
    @AppStorage("email") var email: String = ""
    @Published var password: String = "leer"
    @AppStorage("login") var isLogIn: Bool = true
    
    @Published var playerList: [Player] = [] // Liste für alle Spieler
    
    init(playerRepository: PlayerRepository) {
        self.playerRepository = playerRepository
    }
    
    func loadPlayer(){
        //Spieler aus DB fetchen, wo mail = mail(eingeloggtem User)
    }
    
    func createPlayer(name: String, email: String, password: String) {
        // Eine neue Player-Instanz erstellen und die bestehende `player` ersetzen
        self.name = name
        self.coins = coins
        self.email = email
        self.password = password
        //= Player(name: name, coins: 1000, email: email, password: password)
    }
    
//    func addPlayerToPlayerList() {
//        // Die aktuelle Player-Instanz zur `playerList` hinzufügen
//        if !playerList.contains(where: { $0.email == email }) { // Duplikate vermeiden
//            playerList.append(player)
//        } else {
//            print("Spieler mit dieser E-Mail existiert bereits.")
//        }
//    }
    
    func checkUsername(name: String) -> Bool {
        // Überprüfen, ob der Name bereits vergeben ist
        return playerList.contains { $0.name == name }
    }
    
    func mergePlayer(){
        print(name)
        
        if let newPlayer = playerRepository.findPlayerByMail(email: email){
           
            name = newPlayer.name
            
        }
    }
}
