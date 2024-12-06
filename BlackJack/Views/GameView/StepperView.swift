//
//  StepperView.swift
//  BlackJack
//
//  Created by Alexander Hasecke on 03.12.24.
//

import SwiftUI

struct StepperView: View {

    @State private var customBet: Int = 0
    
    @ObservedObject var gameViewVM: GameViewVM
    @ObservedObject var playViewVM: PlayerViewVM
    
    @Binding var betAmount: Int
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text("Einsatz: \(betAmount) ₿")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)
                Spacer()
                Button(action: { betAmount = 0}) {
                    Image(systemName: "minus.circle")
                        .font(.title)
                        .foregroundStyle(.white)
                        .fontWeight(.heavy)
                }
            }.padding(.horizontal, 40)
            
            HStack {
                
                ZStack {
                    Image("Chip")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                    Button("10") {  betAmount = (betAmount + 10 <= playViewVM.coins) ? betAmount + 10 : playViewVM.coins }
                        .padding()
                        .foregroundColor(.white)
                        .cornerRadius(40)
                        .font(.title3)
                        .fontWeight(.bold)
                    
                }
                ZStack {
                    Image("Chip")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                    
                    Button("100") {
                        betAmount = (betAmount + 100 <= playViewVM.coins) ? betAmount + 100 : playViewVM.coins }
                        .padding()
                        .foregroundColor(.white)
                        .cornerRadius(40)
                        .font(.title3)
                        .fontWeight(.bold)
                }
                ZStack {
                    Image("Chip")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                    Button("1K") {  betAmount = (betAmount + 1000 <= playViewVM.coins) ? betAmount + 1000 : playViewVM.coins }
                        .padding()
                        .foregroundColor(.white)
                        .cornerRadius(40)
                        .font(.title3)
                        .fontWeight(.bold)
                }
                
            }
            HStack {
                TextField("Betrag", value: $customBet, format: .number)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
                    .frame(width: 80)
                
                ZStack {
                    Image("Chip")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 70)
                    
                    Button(action: {  betAmount = (betAmount + customBet <= playViewVM.coins) ? betAmount + customBet : playViewVM.coins}) {
                        Image(systemName: "cross.fill")
                            .font(.title3)
                            .foregroundStyle(.white)
                        
                    }
                }
            }
        }
        //.padding()
    }
}

//#Preview {
//    StepperView(gameViewVM: GameViewVM(repository: CardsRepository()), betAmount: .constant(1000))
//}
