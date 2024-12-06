//
//  SettingsView.swift
//  BlackJack
//
//  Created by Alexander Hasecke on 03.12.24.
//

import SwiftUI

struct SettingsView: View {
    @Binding var activeView: String?
    var body: some View {
        // TODO: determin values to be addressed
        // Text("Kartencover")
        // Text("Deck verhalten")
        // Text("Einsatzbegrenzung")
        // Text("Verlustbegrenzung")
        ZStack {
            ScreenBackgroundColor()
                .ignoresSafeArea()
            VStack {
                Spacer()
                HStack {
                    Image(systemName: "gear.circle")
                    Text("Game Settings")
                    Image(systemName: "gear.circle")
                }
                .font(.largeTitle)
                .foregroundStyle(.white)
                HStack {
                    Image(systemName: "exclamationmark.triangle")
                    Text("UNDER CONSTRUCTION")
                    Image(systemName: "exclamationmark.triangle")
                }
                //}
                .foregroundStyle(.white)
                //}
                Spacer()
                Button(action:{
                    activeView = nil
                }){
                    Text("Beenden")
                        .font(.title)
                }
                .frame(width: 280, height: 60)
                .background(.yellow.opacity(0.8))
                .foregroundStyle(.white)
                .cornerRadius(20)
                .padding(.bottom, 40)
            }
        }
    }
}

#Preview {
    SettingsView(activeView: .constant("Settings"))
}
