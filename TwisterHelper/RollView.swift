//
//  RollView.swift
//  TwisterHelper
//
//  Created by Nazariy Vysokinskyi on 07.02.2022.
//

import SwiftUI

struct RollView: View {
    @Binding var players: Array<String>
    @State private var currentPlayerIndex = 0
    
    let limbs = ["→ ✋🏻", "✋🏻 ←", "→ 🦶🏻", "🦶🏻 ←"]
    @State private var currentLimbIndex = 0
    
    let colors: Array<Color> = [.red, .green, .yellow, .blue]
    @State private var currentColorIndex = 0
    
    var body: some View {
        HStack {
            Spacer()
            
            VStack {
                HStack {
                    Spacer()
                    
                    NavigationLink {
                        StartView()
                            .navigationBarHidden(true)
                    } label: {
                        Image(systemName: "xmark")
                            .font(.system(size: 30, weight: .black, design: .default))
                            .foregroundColor(.black)
                            .padding()
                    }

                }
                
                Spacer()
                
                Text(players[currentPlayerIndex])
                    .font(.system(size: 72))
                
                Text(limbs[currentLimbIndex])
                    .font(.system(size: 150))
                
                Spacer()
                
                Button("Далі →") {
                    endTurn()
                }
                .foregroundColor(Color.primary)
                .font(.system(size: 60))
            }
            
            Spacer()
        }
        .background(colors[currentColorIndex])
        .navigationBarHidden(true)
    }
    
    func endTurn() {
        goToNextPlayer()
        randomizeLimb()
        randomizeColor()
    }
    
    func goToNextPlayer() {
        currentPlayerIndex += 1
        
        if currentPlayerIndex >= players.count {
            currentPlayerIndex = 0
        }
    }
    
    func randomizeLimb() {
        currentLimbIndex = Int.random(in: 0...limbs.count - 1)
    }
    
    func randomizeColor() {
        currentColorIndex = Int.random(in: 0...colors.count - 1)
    }
}

struct RollView_Previews: PreviewProvider {
    static var previews: some View {
        RollView(players: .constant(["Назар", "Сашко", "Олена"]))
    }
}
