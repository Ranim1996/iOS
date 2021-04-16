//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Ranim Alayoubi on 24/03/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var countries = ["estonia", "france", "germany", "ireland", "italy", "nigeria", "poland", "russia", "spain", "uk", "us"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
//    @State private var myAlert = false
    
    var body: some View {
        
//        Stacks*****
        
//        spacing: 20
//        alignment: .leading
//        VStack{
//            Text("Hello, world!")
//            Text("HI")
//        }
        
//        Clolors and Frames*****
        
//        ZStack{
////            Color.pink.opacity(0.25)
////            Color.pink.opacity(0.25).frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
////            Color(red: 1, green: 0.8, blue: 0)
//            Color.pink.opacity(0.25).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
//            Text("HI")
//        }
        
//        Gradient******
        
//        LinearGradient(gradient: Gradient(colors: [Color.gray, Color.blue]), startPoint: .top, endPoint: .bottom)
//
//        RadialGradient(gradient: Gradient(colors: [Color.gray, Color.pink.opacity(0.25)]), center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, startRadius: 20, endRadius: 200)
        
//        AngularGradient(gradient: Gradient(colors: [Color.red, Color.blue, Color.green, Color.purple, Color.yellow]), center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/ )
        
        
//        Buttons and images****
        
//        Button("Click me!"){
//            print("Button is clicked")
//        }
        
//        Button(action: {
//            print("Button is clicked")
//        }){
////            Text("Click me!")
//            HStack{
//                Image(systemName: "pencil")
//                Text("Edit")
//            }
//        }
        
//        Alert****
        
//        Alert(title: Text("Alert"), message: Text("Alert is working :)"), dismissButton: .default(Text("Ok")))
        
//        Button("Show Alert"){
//            self.myAlert = true
//        }
//        .alert(isPresented: $myAlert){
//            Alert(title: Text("Alert"), message: Text("Alert is working :)"), dismissButton: .default(Text("Ok")))
//        }
        
//        ******* GuessTheFlag ************
        
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.white, Color.blue]), startPoint: .top, endPoint: .bottom)
            
            VStack (spacing: 30){
                
                VStack{
                    Text("Tap the flag of....")
                    Text(countries[correctAnswer])
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                
                ForEach(0 ..< 3){ number in
                    Button(action: {
                        self.flagTapped(number)
                    }){
                        Image(self.countries[number]).renderingMode(.original)
                            .clipShape(Capsule())
                            .overlay(Capsule().stroke(Color.black, lineWidth: 0))
                            .shadow(color: .black, radius: 2)
                    }
                }
                
                Spacer()
                
            }
    
        }
        .alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text("Your score is: "), dismissButton: .default(Text("Continue")){
                self.askQuestion()
            })
        }
    }
    
    func flagTapped(_ number: Int){
        if(number == correctAnswer){
            scoreTitle = "Correct :)"
        }
        else{
           scoreTitle = "Wrong :("
        }
        
        showingScore = true
    }
    
    func askQuestion(){
        countries.shuffle()
        correctAnswer = Int.random (in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
