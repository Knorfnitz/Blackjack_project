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
        Text("Darkmode")
        Text("Kartendecks Anzahl")
      //  Text("Kartencover")
        Text("Deck verhalten")
        
        Button(action:{
           
            activeView = nil
        }){
            Text("Beenden")
                .font(.title)
            
            
        }
        .frame(width: 400, height: 75)
        .background(.gray)
        .foregroundStyle(.white)
        .cornerRadius(20)
    }
}

#Preview {
    SettingsView(activeView: .constant("Settings"))
}
