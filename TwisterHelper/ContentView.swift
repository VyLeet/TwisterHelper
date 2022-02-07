//
//  ContentView.swift
//  TwisterHelper
//
//  Created by Nazariy Vysokinskyi on 07.02.2022.
//

import SwiftUI

struct ContentView: View {
    let players = ["Олена", "Олександр", "Назарій"]
    @State private var currentPlayerIndex = 0
    
    let limbs = ["→ ✋🏻", "✋🏻 ←", "→ 🦶🏻", "🦶🏻 ←"]
    @State private var currentLimbIndex = 0
    
    let colors: Array<Color> = [.red, .green, .yellow, .blue]
    @State private var currentColorIndex = 0
    
    var body: some View {
        HStack {
            Spacer()
            
            VStack {
                Spacer()
                
                Text(players[currentPlayerIndex])
                    .font(.system(size: 72))
                
                Text(limbs[currentLimbIndex])
                    .font(.system(size: 150))
                
                Spacer()
                
                Button("Далі →") {
                    goToNextPlayer()
                }
                .foregroundColor(Color.primary)
                .font(.system(size: 60))
            }
            
            Spacer()
        }
        .background(colors[currentColorIndex])
    }
    
    func goToNextPlayer() {
        currentPlayerIndex += 1
        
        if currentPlayerIndex >= players.count {
            currentPlayerIndex = 0
        }
        
        randomizeLimb()
        randomizeColor()
    }
    
    func randomizeLimb() {
        currentLimbIndex = Int.random(in: 0...limbs.count - 1)
    }
    
    func randomizeColor() {
        currentColorIndex = Int.random(in: 0...colors.count - 1)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
