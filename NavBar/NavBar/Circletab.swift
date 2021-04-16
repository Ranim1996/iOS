//
//  Circletab.swift
//  NavBar
//
//  Created by Ranim Alayoubi on 23/03/2021.
//

import SwiftUI

struct Circletab: View {
    
    @Binding var index: Int
    
    var body: some View {
            
        HStack{
            Button(action: {
                self.index = 0
            }, label: {
                VStack{
                    if (self.index != 0) {
                        Image("home").foregroundColor(.black)
                    }
                    else{
                        Image("home").foregroundColor(.white)
                            .padding()
                            .background(Color.red)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .offset(y: -20)
                            .padding(.bottom, -20)
                        Text("Home").foregroundColor(Color.black)
                    }
                }
            })
            Spacer(minLength: 5)
            Button(action: {
                self.index = 1
            }, label: {
                    VStack{
                        if (self.index != 1) {
                            Image("search").foregroundColor(.black)
                        }
                        else{
                            Image("search").foregroundColor(.white)
                                .padding()
                                .background(Color.red)
                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                .offset(y: -20)
                                .padding(.bottom, -20)
                            Text("Search").foregroundColor(Color.black)
                        }
                    }            })
            Spacer(minLength: 5)
            Button(action: {
                self.index = 2
            }, label: {
                    VStack{
                        if (self.index != 2) {
                            Image("like").foregroundColor(.black)
                        }
                        else{
                            Image("like").foregroundColor(.white)
                                .padding()
                                .background(Color.red)
                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                .offset(y: -20)
                                .padding(.bottom, -20)
                            Text("Like").foregroundColor(Color.black)
                        }
                    }
                
            })
            Spacer(minLength: 5)
            Button(action: {
                self.index = 3
            }, label: {
                    VStack{
                        if (self.index != 3) {
                            Image("profile").foregroundColor(.black)
                        }
                        else{
                            Image("profile").foregroundColor(.white)
                                .padding()
                                .background(Color.red)
                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                .offset(y: -20)
                                .padding(.bottom, -20)
                            Text("Profile").foregroundColor(Color.black)
                        }
                    }
                
            })
            
        }
        .padding(.vertical).padding(.horizontal, 25)
        .background(Color.white)
        .animation(.spring())

    }
}

struct Circletab_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
