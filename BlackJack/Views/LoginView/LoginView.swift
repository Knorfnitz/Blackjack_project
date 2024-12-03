//
//  LoginView.swift
//  BlackJack
//
//  Created by Alexander Hasecke on 03.12.24.
//

import SwiftUI

struct LoginView: View {
    @StateObject var playerListViewVM: PlayerListViewVM
    var body: some View {
        VStack{
            Text("Mail/login")
            Text("passwort")
            Text("Login")
            Text("registrieren")
        }
    }
}

#Preview {
    LoginView(playerListViewVM: PlayerListViewVM())
}
