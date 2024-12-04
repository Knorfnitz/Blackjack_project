//
//  Design.swift
//  BlackJack
//
//  Created by 🅰️ppEntwickler  on 02.12.24.
//

//import Foundation
import SwiftUI

struct Design {
    
   
    static let cardBackColor = Color("CardRed") // TONI: nur in zugriff bei keine internet verbindung
    static let cardFaceColor = Color.white // TONI: nur in zugriff bei keine internet verbindung
    static let buttonHitColor = Color.green
    static let buttonStandColor = Color.red
    static let buttonTextColor = Color.white
    static let textColor = Color.white
    static let highlightColor = Color.yellow
    
    
    var primaryColor: Color = .red
    var secondaryColor: Color = .blue
    var foregroundColor: Color = .white
    var backgroundColor: Color = .black
    var cornerRadius: CGFloat = 10
    var shadowRadius: CGFloat = 10
    var fontWeight: Font.Weight = .bold
    var fontSize: CGFloat = 16
    
}
struct BlackjackTheme {
    static let backgroundColor = Color.black
    static let textColor = Color.white
    static let highlightColor = Color.green
    static let highlightColor1 = Color.yellow.opacity(0.8)
    static let cardBackColor = Color.gray
}


struct ScreenBackgroundColor: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [Color.green.opacity(0.8), Color.black]),
            startPoint: .top,
            endPoint: .bottom
        )
        .ignoresSafeArea()
    }
}
#Preview {
    ScreenBackgroundColor()
}
