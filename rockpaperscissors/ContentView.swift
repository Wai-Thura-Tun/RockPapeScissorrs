//
//  ContentView.swift
//  rockpaperscissors
//
//  Created by Wai Thura Tun on 04/11/2023.
//

import SwiftUI

enum GameEmoji: String, CaseIterable {
    case rock = "👊", paper = "✋", scissors = "✌️"
}

struct ContentView: View {
    
    @State private var computer  = GameEmoji.allCases.randomElement()
    @State private var gameStatus: String = "_"
    @State private var score: Int = 0
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.white,.green], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                Spacer()
                Text("Rock,Paper,Scissors!")
                    .font(.title.bold())
                VStack {
                    VStack {
                        Text("Tap emojis below")
                            .foregroundStyle(.secondary)
                            .font(.subheadline)
                            .fontWeight(.bold)
                        Text(gameStatus)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                    }
                    CircleTextView(text: computer!.rawValue, width: 200, height: 200, size: 80)
                    
                    HStack(spacing: 30) {
                        ForEach(GameEmoji.allCases, id: \.self) { emoji in
                            Button {
                                clickEmoji(user: emoji.rawValue)
                            } label: {
                                CircleTextView(text: emoji.rawValue, width: 80, height: 80, size: 50, color: Color.gray)
                            }
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical,30)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 10))
                
                Spacer()
                Spacer()
                
                Text("Score : \(score)")
                    .font(.title.weight(.bold))
                    .foregroundStyle(.white)
            }
            .padding()
        }
    }
    
    func clickEmoji(user: String) {
        computer = GameEmoji.allCases.randomElement()
        if let computer = computer {
            determineGame(user: user, computer: computer)
        }
    }
    
    func determineGame(user: String, computer: GameEmoji) {
        let value = computer.rawValue
        switch computer {
        case .paper:
            if (user == GameEmoji.scissors.rawValue) {
                gameStatus = "Win"
                score += 1
            }
            else if (user == GameEmoji.rock.rawValue) {
                score = score > 0 ? score - 1 : score
                gameStatus = "Lose"
            }
            else {
                gameStatus = "Draw"
            }
        case .rock:
            if (user == GameEmoji.paper.rawValue) {
                gameStatus = "Win"
                score += 1
            }
            else if (user == GameEmoji.scissors.rawValue) {
                gameStatus = "Lose"
                score = score > 0 ? score - 1 : score
            }
            else {
                gameStatus = "Draw"
            }
        case .scissors:
            if (user == GameEmoji.rock.rawValue) {
                gameStatus = "Win"
                score += 1
            }
            else if (user == GameEmoji.paper.rawValue) {
                gameStatus = "Lose"
                score = score > 0 ? score - 1 : score
            }
            else {
                gameStatus = "Draw"
            }
        }
    }
}

#Preview {
    ContentView()
}
