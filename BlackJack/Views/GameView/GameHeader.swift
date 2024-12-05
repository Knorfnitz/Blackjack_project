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
        ZStack{
            HStack{
                Image("NameBackground")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 170)
Spacer()
                Image("NameBackground")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 170)
            }
            //.padding(.horizontal)
            HStack(){
                Text(playViewVM.name)
                    .font(.title2)
                    .foregroundStyle(.white)
                    .frame(width: 170,alignment: .center)
                Spacer()
                Text("\(playViewVM.coins) ₿")
                    .font(.title2)
                    .foregroundStyle(.white)
                    .frame(width: 170,alignment: .center)
            }
            
        }
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true) // Daten nur im Speicher
    let container = try! ModelContainer(for: Player.self, configurations: config)

    let context = container.mainContext

    GameHeader(playViewVM: PlayerViewVM(playerRepository: PlayerRepository(context: context)))
       
}
