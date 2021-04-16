//
//  ContentView.swift
//  WeSplit
//
//  Created by Ranim Alayoubi on 23/03/2021.
//

import SwiftUI

struct ContentView: View {
    
//    actual project for WeSplit
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    
    let tipPercintages = [10, 15, 20, 0]
    
    var totalPerPerson: Double {
//        calculate total per person
        let peopleCount = Double(numberOfPeople + 2)
        let tipselection = Double(tipPercintages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        
        let stringValue = "0.5"
        let doubleValue = Double(stringValue)
        
        let tipValue = orderAmount / 100 * tipselection
        let grandtotal = orderAmount + tipValue
        let amountPerPerson = grandtotal / peopleCount
        
        return amountPerPerson
    
    }
    
//    @State private var tapCount = 0
    
//    @State private var name = ""
    
//    let cousins = ["Ranim", "Reem", "Rama"]
//    @State private var selectedCousin = "Reem"
    
    var body: some View {
//        Form{
////           no more than 10 inputs in a form
////            we can add group or section to add more than 10 item in a form
//            Section{
//                Text("Hello, world!")
//                Text("Hello, world!")
//            }
//            Section{
//                Text("Hello, world!")
//            }
//
//        }
        
        
//        adding navigation to top
//        NavigationView{
//            Form {
//                Section{
//                    Text("Hi")
//                }
//            }.navigationTitle(Text("SwiftUI"))
//        }
        
//        counting button
//        Button(("Tab Count \(tapCount)")){
//            self.tapCount += 1
//        }
        
        
//        binding data
//        Form{
//            TextField("Enter your name!", text: $name)
//            Text("Hello \(name)")
//        }
        
//        loop
//        Form {
//            ForEach(0 ..< 100){
//                Text("I am in A looooop #) \($0)")
//            }
//        }
        
//        Picker("Selected cousin is: ", selection: $selectedCousin){
//            ForEach(0 ..< cousins.count){
//                Text(self.cousins[$0])
//            }
//        }
        
        NavigationView{
            Form{
                Section{
                    TextField("Amount: ", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    
                    Picker("Number of People: ", selection: $numberOfPeople){
                        ForEach(0 ..< 100){
                            Text("\($0) people")
                        }
                    }
                }
                
                Section (header: Text("How much tip do you want to leave?")){
//                    Text("How much tip do you eant to leave?")
                    Picker("Tip Percentage: ", selection: $tipPercentage){
                        ForEach(0 ..< tipPercintages.count){
                            Text("\(self.tipPercintages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section{
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
            }
            .navigationTitle("WeSplit")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
