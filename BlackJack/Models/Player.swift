//
//  User.swift
//  BlackJack
//
//  Created by 🅰️ppEntwickler  on 02.12.24.
//

import Foundation

struct User {
    
    var userId: UUID = UUID()
    var name: String
    var histrory: [Histroy]
    var coins: Int
}
