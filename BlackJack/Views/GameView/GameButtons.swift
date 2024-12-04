//
//  GameButtons.swift
//  BlackJack
//
//  Created by Alexander Hasecke on 04.12.24.
//

import SwiftUI

struct GameButtons: View {
    var body: some View {
        HStack{
            
            Button(action:{
               
                
            }){
                Text("Bet(Einsatz)")
                    .font(.title)
                
            }
            
            .frame(width: 200, height: 75)
            .background(.gray)
            .foregroundStyle(.white)
            .cornerRadius(20)
            
            
            
            Button(action:{
               
                
            }){
                Text("Beenden")
                    .font(.title)
                
                
            }
            .frame(width: 200, height: 75)
            .background(.gray)
            .foregroundStyle(.white)
            .cornerRadius(20)
        }
    }
}


#Preview {
    GameButtons()
}
