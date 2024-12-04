//
//  GameView.swift
//  BlackJack
//
//  Created by Alexander Hasecke on 03.12.24.
//

import SwiftUI

struct GameView: View {
    @StateObject var gameViewVM: GameViewVM = GameViewVM(repository: CardsRepository())
    @State var bet: Int = 0
    @State var playerCardsValue: Int = 0
    @State var dealerCardsValue: Int = 0
    @State var youLose: Bool = false
    @State var youWin: Bool = false
    
    var body: some View {
        ZStack {
            GameBackgroundView()            
            VStack{
                GameHeader(gameViewVM: gameViewVM)
                .frame(height: 80)
                .padding()
                Spacer()
            }
            if !gameViewVM.isGameActive{
    
                BetView(gameViewVM: gameViewVM, bet: $bet)
                
            }else{
                VStack {
                    GameRoundView(gameViewVM: gameViewVM, dealerCardsValue: $dealerCardsValue, playerCardsValue: $playerCardsValue, youLose: $youLose, youWin: $youWin)
                    
                    PlayerTurnButtons(gameViewVM: gameViewVM, dealerCardsValue: $dealerCardsValue, playerCardsValue: $playerCardsValue, youLose: $youLose)
                        .padding(.bottom, 100)
                }
                .padding(.top, 40)
            }
        }
        .task {
            await gameViewVM.getDeck()
            
            
        }
        
        
    }
}

#Preview {
    GameView()
}
