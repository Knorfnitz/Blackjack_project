//
//  Draw.swift
//  BlackJack
//
//  Created by 🅰️ppEntwickler  on 02.12.24.
//

import Foundation

struct Draw: Codable {
    
    var success: Bool
    var deck_id: String
    var cards: [Card]
    var remaining: Int
    
 
    
}
