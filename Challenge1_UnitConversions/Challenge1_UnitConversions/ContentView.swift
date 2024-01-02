//
//  ContentView.swift
//  Challenge1_UnitConversions
//
//  Created by Ahmet Göktürk Kurt on 2.01.2024.
//

import SwiftUI

struct ContentView: View {
    let timeType = ["Seconds","Minutes","Hours","Days"]
    @State private var inputSelectTime = "Seconds"
    @State private var outputSelectTime = "Seconds"
    @State var inputTime = 0.0
    let timeInSeconds = ["Seconds": 1.0, "Minutes": 60.0, "Hours": 3600.0, "Days": 86400.0]
    
    var timeConversions: Double {
        let inputInSeconds = inputTime * timeInSeconds[inputSelectTime]!
        let outputTime = inputInSeconds / timeInSeconds[outputSelectTime]!
        return outputTime
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Choose Your Time Conversions") {
                    TextField("time", value: $inputTime, format:.number)
                    
                    Picker("Input Time", selection: $inputSelectTime) {
                        ForEach(timeType, id:\.self) { name in
                            Text(name)
                        }
                    }
                    Picker("Output Time", selection: $outputSelectTime) {
                        ForEach(timeType, id:\.self) { name in
                            Text(name)
                        }
                        
                    }
                }
                Section("result") {
                    Text(timeConversions, format:.number)
                        
                }
                
                
                
            }.navigationTitle("Unit Conversions")
        }
    }
}

#Preview {
    ContentView()
}
