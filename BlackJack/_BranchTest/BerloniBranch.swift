//
//  BerloniBranch.swift
/// # BlackJack
//
//  Created by Berloni Pepponi on 03.12.24.
//
import SwiftUI
import SwiftData
/** ## Spielstatistik
    ### TODO
    * Wo wollen wir die Werte abspeichern?
        * Soll der Wert mit dem Spiel oder den Spielern gespeichert werden?
        * Soll der Wert in einer Datei abgespeichert werden?
    * Wie wollen wie den Wert abspeichern?
        * M.E. mit SwiftData.
    ---
    ### CODE
    #### DataModel Stuct **/
//struct GameStatsData: Identifiable, Codable {
//    let id: String // = UUID().uuidString
//    let totalGames: Int
//    let wins: Int
//    let losses: Int
//    let highestScore: Int
//    let averageScore: Double
//}
/// #### DataModel Class
//class GameStats: ObservableObject {
//    @Published var totalGames = 0
//    @Published var wins = 0
//    @Published var losses = 0
//    @Published var highestScore = 0
//    @Published var averageScore = 0.0
//    @Published var stats: GameStatsData = .init(id: "", totalGames: 0, wins: 0, losses: 0, highestScore: 0, averageScore: 0.0)
//    private let filename = "gameStats.json"
//    init() { loadStats() }
//    // Zur aktualisierung der Statistikgrundlage:
//    func updateStats(isWin: Bool, score: Int) {
//        totalGames += 1
//        if isWin {
//            wins += 1
//        } else {
//            losses += 1
//        }
//        highestScore = max(highestScore, score)
//        averageScore = Double(
//            totalGames > 0 ? (
//                totalGames * Int(averageScore) + score
//            ) / totalGames : score
//        )
//    }
//    // Falls der Wert gespeichert werden soll:
//    func saveStats() {
//        do {
//            let data = try JSONEncoder().encode(stats)
//            let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(filename)
//            try data.write(to: url)
//        } catch {
//            print("Error saving stats: \(error)")
//        }
//    }
//    // Falls der Wert gespeichert wurde:
//    func loadStats() {
//        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(filename)
//        if FileManager.default.fileExists(atPath: url.path) {
//            do {
//                let data = try Data(contentsOf: url)
//                stats = try JSONDecoder().decode(GameStatsData.self, from: data)
//            } catch {
//                print("Error loading stats: \(error)")
//            }
//        } else {
//            // Create a new GameStat if it doesn't exist
//            // stats = GameStatsData(from: _)
//            print("No stats found")
//            // TODO: ErrorMessageView
//        }
//    }
//}
/// #### View
//struct StatsView: View {
//    @EnvironmentObject var gameStats: GameStats
//    // Statistik gemäß gebräuchlicher Werte
//    var body: some View {
//        VStack {
//            Text("Total Games: \(gameStats.totalGames)")
//            Text("Wins: \(gameStats.wins)")
//            Text("Losses: \(gameStats.losses)")
//            Text("Win Percentage: \(gameStats.wins * 100 / gameStats.totalGames)%")
//            Text("Highest Score: \(gameStats.highestScore)")
//            Text("Average Score: \(gameStats.averageScore, specifier: "%.2f")")
//        }
//        .padding()
//    }
//}
/**
 ### obsolete code
 #### GameStatsData
 ```
 enum CodingKeys: String, CodingKey {
     case totalGames = "total_games"
     case wins = "wins"
     case losses = "losses"
     case highestScore = "highest_score"
     case averageScore = "average_score"
     case stats = "stats"
 }
 ```
 **/
