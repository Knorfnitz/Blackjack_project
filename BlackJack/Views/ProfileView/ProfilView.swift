//
//  ProfilView.swift
//  BlackJack
//
//  Created by Alexander Hasecke on 03.12.24.
//

import SwiftUI


struct ProfilView: View {
    @StateObject var playerViewVM: PlayerViewVM
    var body: some View {
        Text("Profilbild")
        Text("Profilname")
        Text("Profilname ändern")
        Text("Mail")
        Text("Mail ändern")
        Text("Passwort ändern")
        Text("Profilbild hochladen")
        Text("Profilbild Löschen/ändern")
    }
}

#Preview {
    ProfilView(playerViewVM:PlayerViewVM())
}
