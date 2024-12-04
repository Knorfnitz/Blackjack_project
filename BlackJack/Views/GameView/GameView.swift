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
    @State var youDraw: Bool = false
    
    @State private var animationOpacity: Double = 0.0
    @State private var animationScale: CGFloat = 0.5
    
    @State var showBetView: Bool = false
    @State var isTurnActive: Bool = true
    
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
                    if !youWin && !youLose && !youDraw{
                        PlayerTurnButtons(gameViewVM: gameViewVM, dealerCardsValue: $dealerCardsValue, playerCardsValue: $playerCardsValue, youLose: $youLose, youWin: $youWin, youDraw: $youDraw, isTurnActive: $isTurnActive)
                            .padding(.bottom, 100)
                    }else{
                        GameButtons(gameViewVM: gameViewVM, bet: $bet,  youLose: $youLose, youWin: $youWin, youDraw: $youDraw, playerCardsValue: $playerCardsValue, dealerCardsValue: $dealerCardsValue, animationOpacity: $animationOpacity, animationScale: $animationScale, showBetView: $showBetView, isTurnActive: $isTurnActive)
                            .padding(.bottom, 20)
                    }
                }
                .padding(.top, 40)
            }
            if (youWin || youLose || youDraw) && !showBetView{
                VStack {
                    Spacer()
                    if youLose{
                        Text("Du hast verloren")
                            .font(.system(size: 60, weight: .bold))
                            .foregroundColor(.yellow)
                            .shadow(color: .red, radius: 10, x: 0, y: 0)
                            .opacity(animationOpacity)
                            .scaleEffect(animationScale)
                            .onAppear {
                                withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
                                    animationOpacity = 1.0
                                    animationScale = 1.2
                                }
                            }
                    }
                    
                    if youWin{
                        Text("Du hast gewonnen")
                            .font(.system(size: 60, weight: .bold))
                            .foregroundColor(.yellow)
                            .shadow(color: .red, radius: 10, x: 0, y: 0)
                            .opacity(animationOpacity)
                            .scaleEffect(animationScale)
                            .onAppear {
                                withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
                                    animationOpacity = 1.0
                                    animationScale = 1.2
                                }
                            }
                            .task{
                                let price = bet * 2
                                gameViewVM.player.coins += price
                            }
                    }
                    
                    if youDraw{
                        
                        Text("Unentschieden")
                            .font(.system(size: 60, weight: .bold))
                            .foregroundColor(.yellow)
                            .shadow(color: .red, radius: 10, x: 0, y: 0)
                            .opacity(animationOpacity)
                            .scaleEffect(animationScale)
                            .onAppear {
                                withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
                                    animationOpacity = 1.0
                                    animationScale = 1.2
                                }
                            }
                            .task{
                                let price = bet
                                gameViewVM.player.coins += price
                            }
                    }
                    Spacer()
                    
                }
                }
            if showBetView{
                ZStack {
                    Rectangle()
                        .foregroundStyle(.white)
                        .frame(width: .infinity, height: 400)
                        .opacity(0.6)
                    
                    StepperView(gameViewVM: gameViewVM, betAmount: $bet)
                }
                    
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
