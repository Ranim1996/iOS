//
//  ContentView.swift
//  ViewsAndModifires
//
//  Created by Ranim Alayoubi on 25/03/2021.
//

import SwiftUI

//struct CapsuleText: View {
//    var text: String
//
//    var body: some View{
//        Text(text)
//            .font(.largeTitle)
//            .padding()
//            .background(Color.blue)
//            .clipShape(Capsule())
//    }
//}

//struct Title: ViewModifier {
//    func body(content: Content) -> some View {
//        content
//            .font(.largeTitle)
//            .foregroundColor(.white)
//            .padding()
//            .background(Color.blue)
//            .clipShape(RoundedRectangle(cornerRadius: 10))
//    }
//}
//
//
//extension View {
//    func titleStyle() -> some View {
//        self.modifier(Title())
//    }
//}
//
//struct Watermark: ViewModifier {
//    var text: String
//
//    func body(content: Content) -> some View {
//        ZStack(alignment: .bottomTrailing) {
//            content
//            Text(text)
//                .font(.caption)
//                .foregroundColor(.white)
//                .padding(5)
//                .background(Color.black)
//        }
//    }
//}
//
//extension View {
//    func watermarked(with text: String) -> some View {
//        self.modifier(Watermark(text: text))
//    }
//}

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content

    var body: some View {
        VStack {
            ForEach(0 ..< rows, id: \.self) { row in
                HStack {
                    ForEach(0 ..< self.columns, id: \.self) { column in
                        self.content(row, column)
                    }
                }
            }
        }
    }
    
    init(rows: Int, columns: Int, @ViewBuilder content: @escaping (Int, Int) -> Content) {
        self.rows = rows
        self.columns = columns
        self.content = content
        
    }
    
}



struct ContentView: View {
//    var body: Text
    
//    @State private var usedRedText = false
    
////    var motto1: some View { Text("Hello")}
//    let motto1 = Text("Hello")
//    let motto2 = Text("Hi")
    
    
    var body: some View {
        
        
//        Concepts***********
        
//        Text("Hi")
        
//        Text("Hello, world!")
//            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
//            .background(Color.blue)
//            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        
//        Button("Hi There"){
//            print(type(of: self.body))
//        }
//        .frame(width: 200, height: 200)
//        .background(Color.red)
        
//        Text("Hi").padding()
//            .background(Color.red)
//            .padding()
//            .background(Color.blue)
//            .padding()
//            .background(Color.green)
//            .padding()
//            .background(Color.yellow)
        
        
//        Advanced*************
        
//        Button("Hi There"){
//            self.usedRedText.toggle()
//        }.foregroundColor(usedRedText ? .red : .blue)
        
//        VStack{
//            Text("Hi").blur(radius: 0)
//            Text("Hello")
//            Text("Hola")
//            Text("Merhaba")
//        }
//        .blur(radius: 5)
        
//        VStack{
//            motto1.foregroundColor(.purple)
//            motto2.foregroundColor(.red)
//        }
        
//        VStack(spacing: 10) {
//            CapsuleText(text: "Hi")
//                .foregroundColor(.pink)
//            CapsuleText(text: "Hello")
//                .foregroundColor(.white)
//        }
        
        
//        Color.blue
//            .frame(width: 300, height: 300)
//            .watermarked(with: "First Try")
//        Text("hi")
//            .titleStyle()
//            .modifier(Title())
        
        GridStack(rows: 4, columns: 4){ row, col in
            Image(systemName: "\(row * 4 + col).circle")
            Text("R\(row) C\(col)")
//            HStack{
//                Image(systemName: "\(row * 4 + col).circle")
//                Text("R\(row) C\(col)")
//            }
            
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
