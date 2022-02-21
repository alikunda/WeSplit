//
//  ContentView.swift
//  WeSplit
//
//  Created by Mohammed on 2/20/22.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPer = 20
    @FocusState private var amountIsFocus: Bool
    
    let TipPerce = [10,15,20,25,0]
    
    var totalPerPerson: Double{
        //cal the total per person in this code section
        let peopleCount = Double(numberOfPeople)
        let TipSelection = Double(tipPer)
        
        let tipValue = checkAmount / 100 * TipSelection
        
        let grandTotal = checkAmount + tipValue
        let AmountPerPers = grandTotal / peopleCount
        return AmountPerPers
    }
    var GrandTotal: Double{
        //cal the total per person in this code section
        let TipSelection = Double(tipPer)
        let tipValue = checkAmount / 100 * TipSelection
        let grandTotal = checkAmount + tipValue
        return grandTotal
    }
    
    var body: some View {
        NavigationView{
        Form{
            Section{
                TextField("Amount", value: $checkAmount, format:
                                .currency(code: Locale.current.currencyCode ?? "USD"))
                    .keyboardType(.decimalPad)
                    .focused($amountIsFocus)
                    .accessibilityHint("Amount")
             
               
//                Picker("Number of People", selection: $numberOfPeople){
//                    ForEach(2..<100){
//                        Text("\($0) People")
//                    }
//                }
            } header: {
                Text("Amount")
            }
            Section{
                TextField("Number of People", value: $numberOfPeople, format: .number)
                    .keyboardType(.decimalPad)
                    .accessibilityHint("Amount")
                    .focused($amountIsFocus)
                if(numberOfPeople < 2){
                    Text("Number of persons should be more than 2")
                }
            } header: {
                Text("Number of persons")
            }
            Section{
                
                Picker("Tip Percentage", selection: $tipPer){
                    ForEach(TipPerce, id:\.self){
                        Text($0, format: .percent)
                    }
                }
                .pickerStyle(.segmented)
            } header: {
                Text("How much tip do you want to leave?")
            }
            Section{
                Text(GrandTotal, format: .currency(code: Locale.current.currencyCode ?? "USD"))
            } header: {
                Text("Grand Total")
            }
            Section{
                Text(totalPerPerson, format: .currency(code: Locale.current.currencyCode ?? "USD"))
            } header: {
                Text("Amount Per Person")
            }
            }
        
        .navigationTitle("WeSplit")
        .toolbar{
            ToolbarItemGroup(placement: .keyboard){
                Spacer()
                Button("Done"){
                    amountIsFocus = false
                }
            }
        }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
