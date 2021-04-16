//
//  ContentView.swift
//  BetterRest
//
//  Created by Ranim Alayoubi on 25/03/2021.
//

import SwiftUI

struct ContentView: View {
    
    
    
    @State private var sleepAmount = 8.0
    @State private var wakeUp = defaultWakeTime
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    var body: some View {
//        Text("Hello, world!")
//            .padding()
        
//        Steppers****
//        Stepper(value: $sleepAmount, in: 4...12, step: 0.25){
//            Text("\(sleepAmount, specifier: "%.2f") hours")
//        }
        
//        DatePicker****
        
//        let now = Date()
//        let tomorrow = Date().addingTimeInterval(86400)
//        let range = now ... tomorrow
        
//        var component = DateComponents()
//        component.hour = 8
//        component.minute = 30
//        let date = Calendar.current.date(from: component) ?? Date()
        
//        let formatter = DateFormatter()
//        formatter.timeStyle = .short
//        let dateString = formatter.string(from: Date())
//
//        displayedComponents: .hourAndMinute or in: Date()... in DatePicker() parameter
//        return DatePicker("Please enter a time", selection: $wakeUp,
//            displayedComponents: .hourAndMinute)
//            .labelsHidden()
        
        
//        ******Implementation*****
        NavigationView{
            Form{
                Text("When to wakeup?").font(.headline)
                DatePicker("Please enter a time: ", selection: $wakeUp, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                
                Text("Desired amount to sleep:").font(.headline)
                Stepper(value: $sleepAmount, in: 4...12, step: 0.25){
                    Text("\(sleepAmount, specifier: "%g") hours")
                    
                }
                
                Text("Daily coffee intake:").font(.headline)
                
                Stepper(value: $coffeeAmount, in: 1...20){
                    if (coffeeAmount == 1){
                        Text("1 CUP")
                    } else{
                        Text("\(coffeeAmount) cups")
                    }
                    
                }
                
            }
            .navigationTitle("BetterRest")
            .navigationBarItems(trailing:
//                Button("Calculate"){
//                    self.calculateBedTime()
//                }
            
                Button(action: calculateBedTime){
                    Text("Calculate")
                }
            )
            .alert(isPresented: $showingAlert){
                Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
        }
        
    }
    
    static var defaultWakeTime: Date{
        var componnent = DateComponents()
        componnent.hour = 7
        componnent.minute = 0
        
        return Calendar.current.date(from: componnent) ?? Date()
    }
    
    
    func calculateBedTime(){
        let model = SleepCalculater()
        
        let component = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
        
        let hour = (component.hour ?? 0) * 60 * 60
        let minute = (component.minute ?? 0) * 60
        
        do{
            let prediction = try
                model.prediction(wake: Double( hour + minute),
                                 estimatedSleep: sleepAmount,
                                 coffee: Double(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            let format = DateFormatter()
            format.timeStyle = .short
            
            alertMessage = format.string(from: sleepTime)
            alertTitle = ("Your ideal bedtime is....")
            
        }catch{
            alertTitle = "Error"
            alertMessage = "Sorry, there is problem in calculation your bedtime :("
        }
        
        showingAlert = true
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
