//
//  GameStatsData.swift
//  BlackJack
//
//  Created by Berloni Pepponi on 06.12.24.
//

struct GameStatsData: Identifiable, Codable {
    let id: String // = UUID().uuidString
    let totalGames: Int
    let wins: Int
    let losses: Int
    let highestScore: Int
    let averageScore: Double
}
