//
//  NewHabitView.swift
//  HabitOK
//
//  Created by Ярослав Шерстюк on 30.03.2021.
//

import SwiftUI

struct AddNewHabitView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) var moc
    @ObservedObject var area: Areas
    
    @State var newNameHabit: String = ""
    @State var selectionColor: String = "swatch_shipcove"
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Name Habit")) {
                    TextField("Typing name habit", text: $newNameHabit)
                        .keyboardType(.default)
                        .modifier(ClearButton(text: $newNameHabit))
                }
                
                Text ("For: \(area.wrappedName)")
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
                                            //
                                            let newHabit = Habits(context: self.moc)
                                            newHabit.nameHabit = self.newNameHabit
                                            self.newNameHabit = ""
                                            self.area.addToHabits(newHabit)
                                            try? self.moc.save()
                                            //
                                            self.presentationMode.projectedValue.wrappedValue.dismiss()
                                            
                                        }) { Text("Save")
                                        }
                                    }
            )
        }
        
    }
}

//struct NewHabitView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddNewHabitView()
//    }
//}
