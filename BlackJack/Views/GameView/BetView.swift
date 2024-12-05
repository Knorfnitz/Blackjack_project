//
//  BetView.swift
//  BlackJack
//
//  Created by Alexander Hasecke on 04.12.24.
//

import SwiftUI

struct BetView: View {
    @ObservedObject var gameViewVM: GameViewVM
    @ObservedObject var playViewVM: PlayerViewVM
    
    @Binding var bet: Int
    
    var body: some View {
        VStack{
            Spacer()
            
            StepperView(gameViewVM: gameViewVM, playViewVM: playViewVM, betAmount: $bet)
            
            Button(action:{
                
                playViewVM.coins -= bet
                gameViewVM.isGameActive = true
                
                
            }){
                Text("Runde starten")
                    .font(.title)
                    .frame(width: 200)
                    .padding()
                    .foregroundStyle(bet >= 1 ? .white : .clear)
                    .background(bet >= 1 ? .black : .clear)
                    .cornerRadius(20)
                
            }
            
            
            .disabled(bet <= 1)
            
            Spacer()
        }
    }
}

//#Preview {
//    BetView(gameViewVM: GameViewVM(repository: CardsRepository()), bet: .constant(0))
//}
