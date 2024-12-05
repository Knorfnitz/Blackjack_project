//
//  RegView.swift
//  BlackJack
//
//  Created by Alexander Hasecke on 03.12.24.
//

import SwiftUI

struct RegView: View {
    @StateObject var playerListViewVM: PlayerListViewVM
    @StateObject var playerViewVM: PlayerViewVM
    
    
    var body: some View {
        Text("Username:")
        Text("Mail:")
        Text("Passwort")
        Text("jetzt erstellen")
    }
}


