//
//  LoginViewModel.swift
//  BlackJack
//
//  Created by Alexander Hasecke on 05.12.24.
//


import SwiftUI

class LoginViewModel: ObservableObject {
    let playerRepository: PlayerRepository
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String? = nil
    @Published var loginSuccess: Bool = false
    @AppStorage("login") var isLogIn: Bool = false
    
    init(playerRepository: PlayerRepository) {
        self.playerRepository = playerRepository
    }
    
    func login() {
        guard !email.isEmpty, !password.isEmpty else {
            errorMessage = "Bitte füllen Sie alle Felder aus."
            return
        }
        
        if let player = playerRepository.findPlayerBy(email: email, password: password) {
            loginSuccess = true
            isLogIn = true
            errorMessage = nil
            print("Erfolgreich eingeloggt: \(player.name)") // Debug
        } else {
            errorMessage = "Ungültige E-Mail oder Passwort."
        }
    }
}
