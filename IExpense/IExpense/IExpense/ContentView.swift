//
//  ContentView.swift
//  IExpense
//
//  Created by Ranim Alayoubi on 06/04/2021.
//

import SwiftUI

struct ExpenseItem: Identifiable, Codable {
    let id = UUID()
    let name: String
    let type: String
    let cost: Int
}

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]() {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let items = UserDefaults.standard.data(forKey: "Items") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([ExpenseItem].self, from: items) {
                self.items = decoded
                return
            }
        }

        self.items = []
    }
    
}

struct ContentView: View {
    
    @ObservedObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView{
            List{
                ForEach(expenses.items){ item in
//                    Text(item.name)
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }

                        Spacer()
                        Text("$\(item.cost)")
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("IExpense")
            .navigationBarItems(trailing:
                    Button(action: {
                        self.showingAddExpense = true
//                        let exp = ExpenseItem(name: "Test", type: "Personal", cost: 10)
//                        self.expenses.items.append(exp)
                    }){
                        Image(systemName: "plus")
                    }
            )
            .sheet(isPresented: $showingAddExpense){
                AddView(expenses: self.expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet){
        expenses.items.remove(atOffsets: offsets)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
