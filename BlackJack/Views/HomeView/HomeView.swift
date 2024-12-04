//
//  HomeView.swift
//  BlackJack
//
//  Created by Alexander Hasecke on 03.12.24.
//  04.12.2024 Bearbeitet Von @Tonytaor

import SwiftUI


    //var player1: Player = Player(name: "Player1", gameHistory: [], coins: 1000, email: "player1@example.com", password: "Player1")

    struct HomeView: View {
        @StateObject var playerViewVM: PlayerViewVM
        var body: some View {
            NavigationView {
                ZStack {
                    Image("GameTable")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                    
                    //@TONI: Top-Bar mit Spielername und Coins
                    
                    VStack {
                        HStack {
                            Text(playerViewVM.player.name)
                                .font(.system(size: 20, weight: .bold, design: .rounded))
                                .foregroundColor(BlackjackTheme.textColor)
                                .padding(.leading, 50)//@TONI:Nach RX verschieben
                            
                            Spacer()
                            
                            Text("\(playerViewVM.player.coins)")
                                .font(.system(size: 20, weight: .bold, design: .rounded))
                                .foregroundColor(BlackjackTheme.textColor)
                                .padding(.trailing, 50)//@TONI:Nach LX verschieben
                        }
                        .padding(.top, 20)
                        .ignoresSafeArea()
                        Spacer()
                    }
                    
                    VStack(spacing: 20) {
                                        
                                        Text("Willkommen bei \nBlackjack!")
                                            .font(.system(size: 55, weight: .bold, design: .rounded))
                                            .foregroundColor(BlackjackTheme.highlightColor1)
                                            .multilineTextAlignment(.center)
                                            .padding(.bottom, 20)
                                        
                                        
                                        HStack {
                                            Image("Chip")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 50)
                                                .padding(50)
                                            
                                            Image("Chip")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 50)
                                                .padding(55)
                                        }
                                        //@TONI: Button
                                        VStack(spacing: 20) {
                                            NavigationLink(destination: GameView()) {
                                                Text("Spiel starten")
                                                    .font(.title2.bold())
                                                    .padding()
                                                    .frame(maxWidth: .infinity)
                                                    .background(BlackjackTheme.highlightColor1)
                                                    .foregroundColor(.white)
                                                    .cornerRadius(12)
                                                    .shadow(radius: 8)
                                            }
                                            
                                            NavigationLink(destination: StatsView()) {
                                                Text("Statistiken")
                                                    .font(.title2.bold())
                                                    .padding()
                                                    .frame(maxWidth: .infinity)
                                                    .background(BlackjackTheme.highlightColor1)
                                                    .foregroundColor(.white)
                                                    .cornerRadius(12)
                                                    .shadow(radius: 8)
                                            }
                                            
                                            NavigationLink(destination: SettingsView()) {
                                                Text("Einstellungen")
                                                    .font(.title2.bold())
                                                    .padding()
                                                    .frame(maxWidth: .infinity)
                                                    .background(BlackjackTheme.highlightColor1)
                                                    .foregroundColor(.white)
                                                    .cornerRadius(12)
                                                    .shadow(radius: 8)
                                            }
                                        }
                                        .padding(.horizontal, 30)
                                        .padding(.bottom, 40)
                                    }
                                    .padding()
                                    .foregroundColor(BlackjackTheme.textColor)
                                    .cornerRadius(20)
                                    .shadow(radius: 20)
                                }
                                .navigationBarHidden(true)
                            }
                        }
                    }

                    #Preview {
                        HomeView(playerViewVM: PlayerViewVM())
                    }

