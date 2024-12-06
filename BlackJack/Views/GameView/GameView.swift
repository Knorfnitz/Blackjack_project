//
//  GameView.swift
//  BlackJack
//
//  Created by Alexander Hasecke on 03.12.24.
//

import SwiftUI
import SwiftData

struct GameView: View {
    
    @Binding var activeView: String?
    
    @ObservedObject var playViewVM: PlayerViewVM
    
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
                GameHeader(playViewVM: playViewVM)
                    .frame(height: 80)
                    .padding(.top, 30)
                Spacer()
            }
            if !gameViewVM.isGameActive{
                
                BetView(gameViewVM: gameViewVM, playViewVM: playViewVM, bet: $bet)
                
            }else{
                
                VStack {
                    GameRoundView(gameViewVM: gameViewVM, dealerCardsValue: $dealerCardsValue, playerCardsValue: $playerCardsValue, youLose: $youLose, youWin: $youWin)
                    if !youWin && !youLose && !youDraw{
                        PlayerTurnButtons(gameViewVM: gameViewVM, dealerCardsValue: $dealerCardsValue, playerCardsValue: $playerCardsValue, youLose: $youLose, youWin: $youWin, youDraw: $youDraw, isTurnActive: $isTurnActive)
                            .padding(.bottom, 100)
                    }else{
                        GameButtons(playViewVM: playViewVM, gameViewVM: gameViewVM, bet: $bet,  youLose: $youLose, youWin: $youWin, youDraw: $youDraw, playerCardsValue: $playerCardsValue, dealerCardsValue: $dealerCardsValue, animationOpacity: $animationOpacity, animationScale: $animationScale, activeView: $activeView, showBetView: $showBetView, isTurnActive: $isTurnActive)
                            .padding(.bottom, 20)
                    }
                }
                .padding(.top, 40)
            }
            if (youWin || youLose || youDraw) && !showBetView{
                VStack {
                    Spacer()
                    if youLose{
                        Text("Verloren")
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
                        Text("Gewonnen")
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
                                playViewVM.coins += price
                            }
                    }
                    
                    if youDraw{
                        
                        Text("Unentschieden")
                            .font(.system(size: 50, weight: .bold))
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
                                playViewVM.coins += price
                            }
                    }
                    Spacer()
                    
                }
            }
            if showBetView{
                ZStack {
                    
                    Rectangle()
                    
                        .fill(LinearGradient(
                            gradient: Gradient(colors: [Color.green.opacity(0.8), Color.black]),
                            startPoint: .top,
                            endPoint: .bottom
                        ))
                        .foregroundStyle(.white)
                        .frame(width: .infinity, height: 400)
                        .cornerRadius(25)
                    
                    StepperView(gameViewVM: gameViewVM, playViewVM: playViewVM, betAmount: $bet)
                }
                //.background(Color.tableGreen)
            }
        }
        .task {
            await gameViewVM.getDeck()
        }
        
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true) // Daten nur im Speicher
    let container = try! ModelContainer(for: Player.self, configurations: config)
    
    let context = container.mainContext
    
    GameView(activeView: .constant("game"), playViewVM: PlayerViewVM(playerRepository: PlayerRepository(context: context)))
    
}
