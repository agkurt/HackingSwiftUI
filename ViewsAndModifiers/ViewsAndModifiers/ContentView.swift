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
        VStack {
            LinearGradient(colors: [.red,.blue], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            Text("HELLO WORLD")
        }
    }
}

#Preview {
    ContentView()
}
