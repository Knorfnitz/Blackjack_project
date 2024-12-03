//
//  HomeView.swift
//  BlackJack
//
//  Created by Alexander Hasecke on 03.12.24.
//

import SwiftUI

struct HomeView: View {
    @StateObject var playerViewVM: PlayerViewVM
    var body: some View {
        VStack{
            Text("Username")
            Text("Kontostand")
            Text("Weg zu Settings")
            Text("neues Spiel starten")
            Text("Weg zu Statistiken")
            Text("Coins aufladen")
            
        }
    }
}

#Preview {
    HomeView(playerViewVM: PlayerViewVM())
}
