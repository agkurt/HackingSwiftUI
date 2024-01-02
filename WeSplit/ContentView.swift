//
//  ContentView.swift
//  WeSplit
//
//  Created by Ahmet Göktürk Kurt on 2.01.2024.
//
//  Bu projede, bir restoranda yemek yedikten sonra kullanabileceğiniz bir hesap bölme uygulaması geliştireceğiz - yemeğinizin maliyetini giriyorsunuz, ne kadar bahşiş bırakmak istediğinizi ve kaç kişiyle birlikte olduğunuzu seçiyorsunuz ve size her bir kişinin ne kadar ödemesi gerektiğini söylüyor.

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused : Bool
    let tipPercentages = [5,10,20,25,0]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "TRY")) // if u want write int value in textfield u should use format section and u should use local current when write to format
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<101) { number in
                            Text("\(number) people")
                        }
                    }
                }
               
                Section("How much do you want to tip?") {
                    Picker("Tip Percantage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id:\.self) {
                            Text($0,format:.percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD") )
                }
            }.navigationTitle("WeSplit")
                .toolbar {
                    if amountIsFocused {
                        Button("done") {
                            amountIsFocused = false
                        }
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}

