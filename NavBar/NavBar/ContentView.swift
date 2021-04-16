//
//  ContentView.swift
//  NavBar
//
//  Created by Ranim Alayoubi on 23/03/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var index = 0
    
    var body: some View {
        VStack{
            ZStack{
                if index == 0 {
                Color.pink.opacity(0.20).edgesIgnoringSafeArea(.top)
                    
                } else if index == 1 {
                    Color.blue.edgesIgnoringSafeArea(.top)
                    
                }else if index == 2 {
                    Color.yellow.edgesIgnoringSafeArea(.top)
                    
                } else if index == 3 {
                    Color.orange.edgesIgnoringSafeArea(.top)
                    
                }
                
                Text("Hello!!")
            }
            Spacer()
            Circletab(index: $index)
        }.background(Color.pink.opacity(0.15).edgesIgnoringSafeArea(.top))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
