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
                RadialGradient(stops: [
                    .init(color: Color(red: 0.15, green: 0.25, blue: 0.45), location: 0.3),
                    .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)],
                               center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
                flagView
            }.alert("Important Message", isPresented: $showingScore) {
                Button("Countinue") {
                    askQuestion()
                }
            }message: {
                Text("Your choose \(showingTitle)")
            }
        }
    }
    
    func flagTapped(_ number : Int) {
        if number == correctAnswer {
            showingTitle = "Correct"
            score += 1
            if score == 8 {
                score = 0
                showingTitle = "You win, restart game"
            }
        }else {
            showingTitle = "false, that is \(flags[number]) flag"
            score -= 1
        }
        showingScore = true
        
        
    }
    
    
    func askQuestion() {
        flags.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    var flagView : some View {
        VStack {
            Spacer()
            Text("Guess The Flag")
                .foregroundStyle(.white)
                .font(.largeTitle.bold())
            VStack {
                Text("Tap the flag")
                    .foregroundStyle(.secondary)
                    .font(.subheadline.weight(.heavy))
                
                Text(flags[correctAnswer])
                    
                    .font(.largeTitle.weight(.semibold))
                
                ForEach(0..<3) { number in
                    Button(action: {
                        flagTapped(number)
                    }, label: {
                        Image(flags[number])
                            .clipShape(.capsule)
                            .shadow(radius: 10)
                    })
                    .padding()
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical ,20)
            .background(.regularMaterial)
            .clipShape(.rect(cornerRadius: 20))
            
            Spacer()
            
            Text("Your Score \(score) ")
                .foregroundStyle(.white)
                .font(.largeTitle.bold())
            Spacer()
            
        }.padding()
    }
}

#Preview {
    ContentView()
}
