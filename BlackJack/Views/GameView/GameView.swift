//
//  GameView.swift
//  BlackJack
//
//  Created by Alexander Hasecke on 03.12.24.
//

import SwiftUI

struct GameView: View {
    @StateObject var gameViewVM: GameViewVM
    
    var body: some View {
        VStack{
            Text("spielername")
            Text("guthaben")
            Text("dealer cards")
            Text("deck")
            Text("deine karten")
            Text("einsatz Anzeigen")
            Text("Einsatz festlegen")
            Text("passen")
            Text("nächste Karte")
            Text("aktuellen Punkte")
            Text("Runde beenden")
        }
    }
}

#Preview {
    GameView(gameViewVM: GameViewVM())
}
