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
    @FetchRequest(entity: Areas.entity(), sortDescriptors: [])
    var areas: FetchedResults<Areas>
    
    @State var nameArea: String = ""
    @State var selectionColor: String = "swatch_shipcove"
    
    // MARK: - Проверка введённых данных, если данные введены то кнопка сохранить доступна
    var disableForm: Bool {
        nameArea == ""
    }
    
    var body: some View {
        NavigationView {
            
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(Color(selectionColor))
                        .padding()
                        .frame(width: 300, height: 100, alignment: .center)
                    Text("\(nameArea)")
                }
                Divider()
                
                Form {
                    Section(header: Text("Name Area")) {
                        TextField("Typing name area", text: $nameArea)
                            .keyboardType(.default)
                            .modifier(ClearButton(text: $nameArea))
                    }
                    
                    Section(header: Text("Color")) {
                        ColorSwatchView(selection: $selectionColor)
                    }
                }
                
            }
            
            .dismissingKeyboard()
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
                                            newArea.colorArea = self.selectionColor
                                            self.nameArea = ""
                                            try? self.moc.save()
                                            
                                            //---
                                            self.presentationMode.projectedValue.wrappedValue.dismiss()
                                            
                                        }) { Text("Save")
                                        }
                                        .disabled(disableForm)
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
