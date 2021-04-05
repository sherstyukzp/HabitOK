//
//  AddNewAreaView.swift
//  HabitOK
//
//  Created by Ярослав Шерстюк on 02.04.2021.
//

import SwiftUI

struct AddNewAreaView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Areas.entity(), sortDescriptors: []) var areas: FetchedResults<Areas>
    
    @State var nameArea: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Name Area")) {
                    TextField("Typing name area", text: $nameArea)
                        .keyboardType(.default)
                        .modifier(ClearButton(text: $nameArea))
                }
            }
            
            .navigationTitle(Text("New Area"))
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
                                            //---
                                            let newArea = Areas(context: self.moc)
                                            newArea.nameArea = self.nameArea
                                            self.nameArea = ""
                                            try? self.moc.save()
                                            
                                            //---
                                            self.presentationMode.projectedValue.wrappedValue.dismiss()
                                            
                                        }) { Text("Save")
                                        }
                                    }
            )
        }
    }
}

struct AddNewAreaView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewAreaView()
    }
}
