//
//  RegistrationViewModel.swift
//  BlackJack
//
//  Created by Alexander Hasecke on 05.12.24.
//


import SwiftData
import SwiftUI

class RegistrationViewModel: ObservableObject {
     let playerRepository: PlayerRepository
    
    @Published var name: String = ""
    @Published var coins: Int = 1000
    @Published var profileImagePath: String? = nil
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var errorMessage: String? = nil
    @Published var registrationSuccess: Bool = false
    
    init(playerRepository: PlayerRepository) {
        self.playerRepository = playerRepository
    }
    
    func register() {
        // Validierungslogik
        guard !name.isEmpty, !email.isEmpty, !password.isEmpty, password == confirmPassword else {
            errorMessage = "Bitte füllen Sie alle Felder aus und überprüfen Sie das Passwort."
            return
        }
        
        // Spieler erstellen
        playerRepository.createPlayer(name: name, coins: coins, profileImagePath: profileImagePath, email: email, password: password)
        
        // Erfolgsstatus setzen
        registrationSuccess = true
        errorMessage = nil
    }
}
