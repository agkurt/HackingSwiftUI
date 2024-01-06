//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Ahmet Göktürk Kurt on 4.01.2024.
//
// MARK: - CONDITIONAL MODIFIERS"
import SwiftUI


struct ContentView: View {
    var body: some View {
        Color.blue
            .frame(width: 300,height: 200)
          
    }
    
    // you dont use nil with non optinal constant and variable
    let answer:Int? = nil
}

#Preview {
    ContentView()
}
