//
//  StartView.swift
//  TwisterHelper
//
//  Created by Nazariy Vysokinskyi on 07.02.2022.
//

import SwiftUI

struct StartView: View {
    
    @State private var players: [String] = []
    @State private var newPlayerName = ""
    private let colors: Array<Color> = [.mint, .red]
    @State private var currentColor = Color.mint
    
    
    var body: some View {
        NavigationView {
            VStack {
                Group {
                    if !players.isEmpty {
                        ForEach(players, id: \.self) { player in
                            Text(player)
                        }
                    } else {
                        Text("Немає гравців")
                    }
                }
                .font(.system(size: 30, weight: .black, design: .default))
                .padding()
                
                Divider()
                
                HStack {
                    TextField("Ім'я гравця", text: $newPlayerName)
                        .padding()
                        .font(.title)
                    
                    Button {
                        let oldColor = currentColor
                        
                        if !players.contains(newPlayerName) {
                            players.append(newPlayerName)
                            newPlayerName = ""
                            currentColor = .green
                        } else {
                            currentColor = .red
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            currentColor = oldColor
                        }
                    } label: {
                        Text("Додати")
                            .padding()
                            .foregroundColor(.primary)
                            .font(.title2)
                    }
                }
                
                Spacer()
                
                NavigationLink {
                    RollView(players: $players)
                } label: {
                    Text("Грати →")
                        .font(.largeTitle)
                        .foregroundColor(isPlayButtonDisabled ? .secondary : .primary)
                        .bold()
                }
                .disabled(isPlayButtonDisabled)
            }
            .background(currentColor)
            .navigationTitle("Гравці")
        }
    }
    
    var isPlayButtonDisabled: Bool { players.isEmpty }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
