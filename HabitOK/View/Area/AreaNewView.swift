//
//  AreaNewView.swift
//  HabitOK
//
//  Created by Ярослав Шерстюк on 25.03.2022.
//

import SwiftUI

struct AreaNewView: View {
    
    @Environment(\.managedObjectContext) var viewContext
    @EnvironmentObject var areaVM: AreaViewModel
    
    @State private var isPresentedIcon: Bool = true
    
    @Binding var isNewArea: Bool
    
    var disableForm: Bool {
        areaVM.nameAreaSave.isEmpty ||
        areaVM.iconAreaSave.isEmpty ||
        areaVM.colorAreaSave.isEmpty
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    VStack {
                        ZStack {
                            Circle()
                                .fill(Color(areaVM.colorAreaSave.isEmpty ? "swatch_articblue" : areaVM.colorAreaSave))
                                .frame(width: 90, height: 90)
                                .shadow(radius: 10)
                                .padding()
                            Image(systemName: areaVM.iconAreaSave.isEmpty ? "creditcard.fill" : areaVM.iconAreaSave)
                                .font(Font.largeTitle)
                                .foregroundColor(Color.white)
                        }
                        
                        TextField("Name area", text: $areaVM.nameAreaSave)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10.0)
                            .padding(.bottom)
                    }
                }
                Section(header: Text("Color")) {
                    ColorSwatchView(selection: $areaVM.colorAreaSave)
                }
                Section(header: Text("Icon")) {
                    SFSymbolsPicker(isPresented: $isPresentedIcon, icon: $areaVM.iconAreaSave, category: .objects , axis: .vertical, haptic: true).frame(height: 300)
                }
                
                
                if areaVM.areaItem != nil {
                    Section(header: Text("Date of creation")) {
                        Text(areaVM.dateCreatedAreaSave, style: .date)
                    }
                }
                
                
            }.dismissingKeyboard()
            
                .navigationTitle(areaVM.areaItem == nil ? "New" : "Edit")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        Button(action: {
                            areaVM.createArea(context: viewContext)
                            self.isNewArea.toggle()
                        }) {
                            Text(areaVM.areaItem == nil ? "Save" : "Update")
                        }.disabled(disableForm)
                    }
                    
                    ToolbarItemGroup(placement: .navigationBarLeading) {
                        Button(action: {
                            self.isNewArea.toggle()
                        }) {
                            Text("Cancel").bold()
                                .foregroundColor(Color.blue)
                        }
                    }
                }
        }
    }
}

struct AreaNewView_Previews: PreviewProvider {
    static var previews: some View {
        AreaNewView(isNewArea: .constant(false))
    }
}
