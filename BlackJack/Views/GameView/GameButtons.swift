//
//  GameButtons.swift
//  BlackJack
//
//  Created by Alexander Hasecke on 04.12.24.
//

import SwiftUI

struct GameButtons: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var playViewVM: PlayerViewVM
    
    @ObservedObject var gameViewVM: GameViewVM
    @Binding var bet: Int
    @Binding var youLose: Bool
    @Binding var youWin: Bool
    @Binding var youDraw: Bool
    @Binding var playerCardsValue: Int
    @Binding var dealerCardsValue: Int
    @Binding var animationOpacity: Double
    @Binding var animationScale: CGFloat
    
    @Binding var activeView: String?

    @Binding var showBetView: Bool
    @Binding var isTurnActive: Bool
    
    var body: some View {
        if gameViewVM.deck.remaining >= 14 || isTurnActive {
            VStack{
                
                
                HStack{
                    
                    
                    Button(action:{
                        gameViewVM.isGameActive = true
                        youLose = false
                        youWin = false
                        youDraw = false
                        playViewVM.coins -= bet
                        gameViewVM.dealerCards = []
                        gameViewVM.playerCards = []
                        playerCardsValue = 0
                        dealerCardsValue = 0
                        animationOpacity = 0.0
                        animationScale = 0.5
                        showBetView = false
                        
                        
                        
                    }){
                        Text("Bet \(bet)₿")
                            .font(.title)
                        
                    }
                    
                    .frame(width: 200, height: 75)
                    .background(.gray)
                    .foregroundStyle(.white)
                    .cornerRadius(20)
                    
                    
                    
                    Button(action:{
                        activeView = nil
                        
                    }){
                        Text("Beenden")
                            .font(.title)
                        
                        
                    }
                    .frame(width: 200, height: 75)
                    .background(.gray)
                    .foregroundStyle(.white)
                    .cornerRadius(20)
                }
                Button(action:{
                    
                    showBetView = true
                    
                    
                }){
                    Text("Anderer Betrag")
                        .font(.title)
                    
                }
                
                .frame(width: 200, height: 75)
                .background(.gray)
                .foregroundStyle(.white)
                .cornerRadius(20)
            }
        }else{
            VStack{
                Text ("Spiel beendet! Deck aufgebraucht!")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                Button(action:{
                   // dismiss()
                    activeView = nil
                }){
                    Text("Beenden")
                        .font(.title)
                    
                    
                }
                .frame(width: 400, height: 75)
                .background(.gray)
                .foregroundStyle(.white)
                .cornerRadius(20)
            }
            .padding(.top, 20)
            .padding(.bottom, 40)
        }
    }
}



