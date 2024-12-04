//
//  StatsView.swift
//  BlackJack
//
//  Created by Alexander Hasecke on 03.12.24.
//


import SwiftUI

struct StatsView: View {
    @ObservedObject var gameStats: GameStats
    
    var body: some View {
        NavigationStack {  // Um die Navigation zu ermöglichen
            ZStack {
                ScreenBackgroundColor()
                
                VStack(spacing: 16) {
                    Text("Statistiken")
                        .font(.largeTitle.bold())
                        .foregroundColor(.white)
                        .padding(.bottom, 20)
                    
                    Text("Total Games: \(gameStats.totalGames)")
                        .font(.title3)
                        .foregroundColor(.white)
                    Text("Wins: \(gameStats.wins)")
                        .font(.title3)
                        .foregroundColor(.white)
                    Text("Losses: \(gameStats.losses)")
                        .font(.title3)
                        .foregroundColor(.white)
                    if gameStats.totalGames > 0 {
                        Text("Win Percentage: \(gameStats.wins * 100 / gameStats.totalGames)%")
                            .font(.title3)
                            .foregroundColor(.white)
                    } else {
                        Text("Win Percentage: N/A")
                            .font(.title3)
                            .foregroundColor(.white)
                    }
                    
                    Text("Highest Score: \(gameStats.highestScore)")
                        .font(.title3)
                        .foregroundColor(.white)
                    Text("Average Score: \(gameStats.averageScore, specifier: "%.2f")")
                        .font(.title3)
                        .foregroundColor(.white)
                    
                    Spacer()  // Damit der Button am unteren Rand erscheint
                    
                    // Hier verwenden wir einen NavigationLink, um den Benutzer zum HomeView zu navigieren
                    NavigationLink(destination: HomeView(playerViewVM: PlayerViewVM())) {
                        Text("Zurück zum Home")
                            .font(.title2)
                            .bold()
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.yellow.opacity(0.8))  // Hier kannst du eine benutzerdefinierte goldene Farbe verwenden
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding([.leading, .trailing], 20)
                    }
                }
                .padding(.top, -55)
                .multilineTextAlignment(.center)
                .navigationBarTitle("Statistiken", displayMode: .inline)
            }
        }
    }
}

/**
 ```
 #Preview {
     let totalGames: Int = 0
     let wins: Int = 0
     let losses: Int = 0
     let highestScore: Int = 0
     let averageScore: Double = 0.0
     StatsView(gameStats: GameStats(totalGames: totalGames, wins: wins, losses: losses, highestScore: highestScore, averageScore: averageScore))
 }
 ```
 **/
