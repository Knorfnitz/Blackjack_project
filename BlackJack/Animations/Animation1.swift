//
//  ContentView.swift
//  BlackJack
//
//  Created by Alexander Hasecke on 05.12.24.
//


//
//  ContentView.swift
//  BlackJackAppAnim
//
//  Created by 🅰️ppEntwickler  on 05.12.24.
//
//  OpenSource: Fabula
//  P279_RotatingPlayingCard.swift
//  Created by tgeisse on 12/6/22.
//

import SwiftUI

public struct Animation1: View {
    
    public var body: some View {
        RotatingCard()
    }
}

enum CardDisplaySide {
    case front
    case back
}

struct RotatingCard: View {
    @State private var rotationAngle: Double = 0
    @State private var flippingAngle: Double = 0
    @State private var displaySide = CardDisplaySide.back
    
    var body: some View {
        ZStack{
            Rectangle().foregroundStyle(Color.black).ignoresSafeArea()
            VStack {
                Spacer()
                RenderCard(displaySide: displaySide)
                    .modifier(FlippingAnimation(angle: flippingAngle,
                                                displaySide: $displaySide))
                    .modifier(RotatingAnimation(angle: rotationAngle))
                    .onAppear {
                        DispatchQueue.main.async {
                            withAnimation(.linear(duration:5).repeatForever(autoreverses: false)) {
                                flippingAngle = 360
                            }
                            
                            withAnimation(.linear(duration: 12).repeatForever(autoreverses: false)) {
                                rotationAngle = 360
                            }
                        }
                    }
                
                
                Spacer()
                
                Image("UiCoDeIcon").resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .cornerRadius(26)
                
                
                Link("📩 Team @ UiCo.de 🌍", destination: URL(string: "https://UiCo.de")!).fontWeight(.bold)
                    .foregroundColor(.accentColor) // Linkfarbe
                    .underline() // Unterstreichen des Links
                    .foregroundColor(.gray)
                    .padding(.top, 2)
                
            }
            .padding(.bottom, 40)
        }
    }
        
}

struct RotatingAnimation: Animatable, ViewModifier {
    var angle: Double
    
    var animatableData: Double {
        get { angle }
        set { angle = newValue }
    }
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(angle))
    }
}

struct FlippingAnimation: Animatable, ViewModifier {
    var angle: Double
    @Binding var displaySide: CardDisplaySide
    
    var animatableData: Double {
        get { angle }
        set {  angle = newValue }
    }
    
    func body(content: Content) -> some View {
        // So that the view is not modified while being drawn, DispatchQueue is used
        DispatchQueue.main.async {
            if 90 <= self.angle && self.angle <= 270 { self.displaySide = .front }
            else { self.displaySide = .back }
        }
        
        return content
            .rotation3DEffect(.degrees(angle),
                              axis: (x: 0.0, y: 1.0, z: 0.0))
    }
}

struct RenderCard: View {
    let displaySide: CardDisplaySide
    
    var body: some View {
        Group {
            if displaySide == .back {
                Image("BlackJackAppBack").cornerRadius(100)
            } else {
                Image("BlackJackAppFront").cornerRadius(100)
            }
        }
        .frame(width: 200, height: 280)
        .background(RoundedRectangle(cornerRadius: 5)
            .fill(.white)
            .shadow(radius: 5)
        )
    }
}


#Preview {
    Animation1()
}
