//
//  GameHeader.swift
//  BlackJack
//
//  Created by Alexander Hasecke on 04.12.24.
//

import SwiftUI
import SwiftData

struct GameHeader: View {
   // @ObservedObject var gameViewVM: GameViewVM
    @ObservedObject var playViewVM: PlayerViewVM
    
    var body: some View {
        HStack{
            Text(playViewVM.name)
                .font(.title)
                .foregroundStyle(.white)
            Spacer()
            Text("\(playViewVM.coins) ₿")
                .font(.title)
                .foregroundStyle(.white)
            
        }
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true) // Daten nur im Speicher
    let container = try! ModelContainer(for: Player.self, configurations: config)

    let context = container.mainContext

    GameHeader(playViewVM: PlayerViewVM(playerRepository: PlayerRepository(context: context)))
       
}
