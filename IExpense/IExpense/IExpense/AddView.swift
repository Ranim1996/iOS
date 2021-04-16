//
//  AddView.swift
//  IExpense
//
//  Created by Ranim Alayoubi on 06/04/2021.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode

    @ObservedObject var expenses: Expenses
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var cost = ""

    static let types = ["Business", "Personal"]

    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                Picker("Type", selection: $type) {
                    ForEach(Self.types, id: \.self) {
                        Text($0)
                    }
                }
                TextField("Amount", text: $cost)
                    .keyboardType(.numberPad)
            }
            .navigationBarTitle("Add Expense")
            .navigationBarItems(trailing: Button("Save") {
                if let actualAmount = Int(self.cost) {
                    let item = ExpenseItem(name: self.name, type: self.type, cost: actualAmount)
                    self.expenses.items.append(item)
                    
                    self.presentationMode.wrappedValue.dismiss()
                }
            })
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
