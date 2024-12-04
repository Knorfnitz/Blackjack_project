//
//  GameRoundView.swift
//  BlackJack
//
//  Created by Alexander Hasecke on 04.12.24.
//

import SwiftUI

struct GameRoundView: View {
    @ObservedObject var gameViewVM: GameViewVM
    @Binding var dealerCardsValue: Int
    @Binding var playerCardsValue: Int
    @Binding var youLose: Bool
    @Binding var youWin: Bool
    
    var body: some View {
        VStack{
            Spacer()
            HStack{
                ForEach(gameViewVM.dealerCards, id: \.code) { card in
                    
                    AsyncImage(url: URL(string: card.image)) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                                .frame(width: 100, height: 100)
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: 100)
                                .clipped()
                        case .failure:
                            Image(systemName: "photo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .foregroundColor(.gray)
                        @unknown default:
                            EmptyView()
                        }
                    }
                    
                }
            }
            .frame(height: 120)
            .padding(.horizontal, 20)
            Text("\(dealerCardsValue)")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 30)
            
            
            ZStack {
                Image("CardCover1")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                Text("\(gameViewVM.deck.remaining)")
                    .font(.title)
                    .foregroundStyle(.white)
            }
            
            Spacer()
            
            
            
            HStack{
                ForEach(gameViewVM.playerCards, id: \.code) { card in
                    
                    AsyncImage(url: URL(string: card.image)) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                                .frame(width: 100, height: 100)
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: 100)
                                .clipped()
                        case .failure:
                            Image(systemName: "photo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .foregroundColor(.gray)
                        @unknown default:
                            EmptyView()
                        }
                    }
                    
                }
            }
            .frame(height: 120)
            .padding(.horizontal, 20)
            
         //   Spacer()
            Text("\(playerCardsValue)")
                .font(.title)
                .fontWeight(.bold)
            
            if !youLose {

        }
                Spacer()
            }
    }
}

#Preview {
    GameRoundView(gameViewVM: GameViewVM(repository: CardsRepository()), dealerCardsValue: .constant(0), playerCardsValue: .constant(0), youLose: .constant(false), youWin: .constant(false))
}
