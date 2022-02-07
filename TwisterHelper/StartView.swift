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
    
    var body: some View {
        NavigationView {
            VStack {
                ForEach(players, id: \.self) { player in
                    Text(player)
                        .font(.title)
                }
                
                Divider()
                
                HStack {
                    TextField("Ім'я гравця", text: $newPlayerName)
                        .padding()
                        .font(.title)
                    
                    Button {
                        players.append(newPlayerName)
                        newPlayerName = ""
                    } label: {
                        Text("Додати")
                            .padding()
                            .foregroundColor(.primary)
                    }
                }
                
                Spacer()
                
                NavigationLink {
                    RollView(players: $players)
                } label: {
                    Text("Грати →")
                        .font(.largeTitle)
                        .foregroundColor(.primary)
                        .bold()
                }
            }
            .navigationTitle("Гравці")
            .background(.mint)
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
