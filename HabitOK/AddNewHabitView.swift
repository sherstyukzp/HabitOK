//
//  NewHabitView.swift
//  HabitOK
//
//  Created by Ярослав Шерстюк on 30.03.2021.
//

import SwiftUI

struct AddNewHabitView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var nameHabit: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Name Habit")) {
                    TextField("Typing name habit", text: $nameHabit)
                        .keyboardType(.default)
                        .modifier(ClearButton(text: $nameHabit))
                }
            }
            
            .navigationTitle(Text("New Habit"))
            .navigationBarItems(leading:
                                    HStack {
                                        Button(action: {
                                            print("👉 button pressed Cancel...")
                                            self.presentationMode.projectedValue.wrappedValue.dismiss()
                                        }) {
                                            Text("Cancel")
                                        }
                                    }
                                , trailing:
                                    HStack {
                                        Button(action: {
                                            print("👉 button pressed Save...")
                                            
                                        }) { Text("Save")
                                        }
                                    }
            )
        }
        
    }
}

struct NewHabitView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewHabitView()
    }
}
