//
//  GameBackgroundView.swift
//  BlackJack
//
//  Created by Alexander Hasecke on 04.12.24.
//

import SwiftUI

struct GameBackgroundView: View {
    var body: some View {
        Image("GameTable")
            .resizable()
            .scaledToFill()
            .ignoresSafeArea()
            .frame(height: UIScreen.main.bounds.height)
    }
}

#Preview {
    GameBackgroundView()
}
