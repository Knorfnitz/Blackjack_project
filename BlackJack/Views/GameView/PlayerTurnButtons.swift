//
//  PlayerTurnButtons.swift
//  BlackJack
//
//  Created by Alexander Hasecke on 04.12.24.
//

import SwiftUI

struct PlayerTurnButtons: View {
    @ObservedObject var gameViewVM: GameViewVM
    @Binding var dealerCardsValue: Int
    @Binding var playerCardsValue: Int
    @Binding var youLose: Bool
    @Binding var youWin: Bool
    @Binding var youDraw: Bool
    
    @Binding var isTurnActive: Bool
 
    var body: some View {
        HStack{
            
            Button(action:{
                Task {
                    await gameViewVM.drawCardFromDeck(deckid: gameViewVM.deck.deck_id, amountOfDrawingCards: 1)
                    let newCard: Card = gameViewVM.draw.cards.first!
                    gameViewVM.playerCards.append(newCard)
                    gameViewVM.deck.remaining = gameViewVM.draw.remaining
                    
                    playerCardsValue = gameViewVM.calculateCardsValue(cards: gameViewVM.playerCards)
                    
                    if playerCardsValue > 21 {
                        youLose = true
                    }
                    
                }
                
            }){
                Text("Karte ziehen")
                    .font(.title)
                
            }
            //.buttonStyle(.borderedProminent)
            .frame(width: 200, height: 75)
            .background(.gray)
            .foregroundStyle(.white)
            .cornerRadius(20)
            
            
            
            Button(action:{
                Task {
                    while dealerCardsValue < 16 {
                        await gameViewVM.drawCardFromDeck(deckid: gameViewVM.deck.deck_id, amountOfDrawingCards: 1)
                        let newCard: Card = gameViewVM.draw.cards.first!
                        gameViewVM.dealerCards.append(newCard)
                        gameViewVM.deck.remaining = gameViewVM.draw.remaining
                        
                        dealerCardsValue = gameViewVM.calculateCardsValue(cards: gameViewVM.dealerCards)
                        sleep(2)
                    }
                    if dealerCardsValue > 21 || playerCardsValue > dealerCardsValue{
                        youWin = true
                        isTurnActive = false
                    }else{
                        if playerCardsValue == dealerCardsValue{
                            youDraw = true
                            isTurnActive = false
                        }else{
                            youLose = true
                            isTurnActive = false
                        }
                    }
                    
                }
                
            }){
                Text("Check")
                    .font(.title)
                
                
            }
            .frame(width: 200, height: 75)
            .background(.gray)
            .foregroundStyle(.white)
            .cornerRadius(20)
        }
    }
}

#Preview {
    PlayerTurnButtons(gameViewVM: GameViewVM(repository: CardsRepository()), dealerCardsValue: .constant(0), playerCardsValue: .constant(0), youLose: .constant(false), youWin: .constant(false), youDraw: .constant(false), isTurnActive: .constant(true))
}
