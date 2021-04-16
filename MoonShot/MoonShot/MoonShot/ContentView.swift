//
//  ContentView.swift
//  MoonShot
//
//  Created by Ranim Alayoubi on 06/04/2021.
//

import SwiftUI

//struct CustomText: View {
//    var text: String
//
//    var body: some View {
//        Text(text)
//    }
//
//    init(_ text: String) {
//        print("Creating a new text")
//        self.text = text
//    }
//}

struct ContentView: View {
    
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")

    var body: some View {
        
//        resizing images****
//        VStack {
//            GeometryReader { geo in
//                Image("test")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: geo.size.width)
//            }
//        }
        
//        scrolling****
//        ScrollView(.vertical)
//        List {
//            VStack(spacing: 10) {
//                ForEach(0..<20) {
//                    CustomText("Item \($0)")
//                        .font(.title)
//                }
//            }
////            .frame(maxWidth: .infinity)
//        }
        
//        Pushing new views onto a STACK*****
//        NavigationView {
//            VStack {
//                List(0..<20) { row in
//                    NavigationLink(destination: Text("Detail \(row)")) {
//                        Text("Row \(row)")
//                    }
//                }
//            }
//            .navigationBarTitle("SwiftUI")
//        }
        
//        Hirarichecal Codable data***
//        Button("Decode JSON") {
//            let input = """
//            {
//                "name": "Jhon",
//                "address": {
//                    "street": "60, Street name",
//                    "city": "Utrecht"
//                }
//            }
//            """
//
//            struct User: Codable {
//                var name: String
//                var address: Address
//            }
//
//            struct Address: Codable {
//                var street: String
//                var city: String
//            }
//
//            let data = Data(input.utf8)
//            let decoder = JSONDecoder()
//            if let user = try? decoder.decode(User.self, from: data) {
//                print(user.address.street)
//            }
//        }
        
//        Load Codable data*******
//        Text("\(astronauts.count)")
        
        
//        Actual App****
        NavigationView {
            List(missions) { mission in
                NavigationLink(destination: MissionView(mission: mission, astronauts: self.astronauts)) {
                    Image(mission.image)
                        .resizable()
//                        .aspectRatio(contentMode: .fit)
                        .scaledToFit()
                        .frame(width: 44, height: 44)

                    VStack(alignment: .leading) {
                        Text(mission.displayName)
                            .font(.headline)
                        Text(mission.formattedLaunchDate)
                    }
                }
            }
            .navigationBarTitle("Moonshot")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
