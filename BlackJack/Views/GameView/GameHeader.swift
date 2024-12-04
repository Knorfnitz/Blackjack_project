//
//  GameHeader.swift
//  BlackJack
//
//  Created by Alexander Hasecke on 04.12.24.
//

import SwiftUI

struct GameHeader: View {
    @ObservedObject var gameViewVM: GameViewVM
    var body: some View {
        HStack{
            Text(gameViewVM.player.name)
                .font(.title)
                .foregroundStyle(.white)
            Spacer()
            Text("\(gameViewVM.player.coins)")
                .font(.title)
                .foregroundStyle(.white)
            
        }
    }
}

#Preview {
    GameHeader(gameViewVM: GameViewVM(repository: CardsRepository()))
}
