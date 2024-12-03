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
    
    var body: some View {
     
            ZStack {
               
                Image("GameTable")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                if !gameViewVM.isGameActive{
                    VStack{
                        // Spacer()
                        HStack{
                            Text(gameViewVM.player.name)
                                .font(.title)
                                .foregroundStyle(.white)
                            Spacer()
                            Text("\(gameViewVM.player.coins)")
                                .font(.title)
                                .foregroundStyle(.white)
                            
                        }
                        .padding()
                        .padding(.top, 20)
                        
                        Spacer()
//                        Text("\(gameViewVM.deck.deck_id)|\(gameViewVM.deck.remaining)|\(gameViewVM.deck.shuffled)|\(gameViewVM.deck.success)")
//                        Text("\(gameViewVM.draw.cards.first?.code ?? "XX")")
//                        Text("guthaben")
//                        Text("dealer cards")
//                        Text("deck")
//                        Text("deine karten")
//                        Text("einsatz Anzeigen")
//                        Text("Einsatz festlegen")
//                        Text("passen")
//                        Text("nächste Karte")
//                        Text("aktuellen Punkte")
//                        Text("Runde beenden")
                        StepperView(gameViewVM: gameViewVM, betAmount: $bet)
                        
                        Button(action:{
//                            Task {
//                                await gameViewVM.drawCardFromDeck(deckid: gameViewVM.deck.deck_id, amountOfDrawingCards: 1)
//                            }
                            gameViewVM.player.coins -= bet
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
                }else{
                    ZStack{
                   
                        
                        VStack{
                            Spacer()
                          
                            Text("\(gameViewVM.deck.remaining)")
                            Spacer()
                            Spacer()
                            
                            
                        }
                        HStack{
                            ForEach(gameViewVM.playerCards, id: \.code) { card in
                                
                                AsyncImage(url: URL(string: card.image)) { phase in
                                    switch phase {
                                    case .empty:
                                        ProgressView() // Ladeanzeige
                                            .frame(width: 100, height: 100)
                                    case .success(let image):
                                        image
                                            .resizable()
                                            .scaledToFit() // Bild wird auf die maximale Breite skaliert
                                            .frame(maxWidth: 100) // Maximale Breite von 100px
                                            .clipped() // Verhindert, dass das Bild aus der Box herausragt
                                    case .failure:
                                        Image(systemName: "photo") // Platzhalter-Bild
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 100, height: 100)
                                            .foregroundColor(.gray)
                                    @unknown default:
                                        EmptyView()
                                    }
                                }
                                   
                            }
                        }.padding(.horizontal, 20)
                        VStack{
                            Spacer()
                            Spacer()
                            Spacer()
                            Button(action:{
                                Task {
                                    await gameViewVM.drawCardFromDeck(deckid: gameViewVM.deck.deck_id, amountOfDrawingCards: 1)
                                    let newCard: Card = gameViewVM.draw.cards.first!
                                    gameViewVM.playerCards.append(newCard)
                                    gameViewVM.deck.remaining = gameViewVM.draw.remaining
                                }
                            
                                
                                
                            }){
                                Text("Karte ziehen")
                                    .font(.title)
                                
                                   
                            }
                    Spacer()
                        }
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
