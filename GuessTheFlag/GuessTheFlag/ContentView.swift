//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Ahmet Göktürk Kurt on 3.01.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var flags = ["Estonia","France","Germany","Ireland","Italy","Monaco","Nigeria","Poland","Spain","UK","Ukraine","USA" ].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var score = 0
    @State private var showingScore: Bool
    
    init() {
        showingScore = false
    }
    
    @State private var showingTitle = ""
    
    var body: some View {
        VStack {
            ZStack {
                LinearGradient(colors: [.blue, .white], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                VStack {
                    Text("Tap the flag")
                    Text("")
                    ForEach(0..<3) { number in
                        Button(action: {
                            flagTapped(number)
                        }, label: {
                            Image(flags[number])
                        })
                        .padding()
                    }
                }
            }.alert("", isPresented: $showingScore) {
                Button("Countinue") {
                    askQuestion()
                }
            }message: {
                Text("\(showingTitle), Your score: \(score) ")
            }
        }
    }
    
    func flagTapped(_ number : Int) {
        if number == correctAnswer {
            showingTitle = "Correct"
            score += 1
        }else {
            showingTitle = "False"
            score -= 1
        }
        showingScore = true
    }
    
    func askQuestion() {
        flags.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
    }
}

#Preview {
    ContentView()
}
