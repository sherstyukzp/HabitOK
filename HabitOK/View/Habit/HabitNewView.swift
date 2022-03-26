//
//  HabitNewView.swift
//  HabitOK
//
//  Created by Ярослав Шерстюк on 25.03.2022.
//

import SwiftUI

struct HabitNewView: View {
    
    @Environment(\.managedObjectContext) var viewContext
    @EnvironmentObject var habitVM: HabitViewModel
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \AreaEntity.nameArea, ascending: true)],animation:.default)
    private var fetchedArea: FetchedResults<AreaEntity>
    
    @State private var selectedArea: AreaEntity?
    
    @State private var isPresentedIcon: Bool = true
    
    @Binding var isNewHabit: Bool
    
    var disableForm: Bool {
        habitVM.nameHabitSave.isEmpty
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Name")) {
                    TextField("Name habit", text: $habitVM.nameHabitSave)
                }
                   
                Section(header: Text("Area")) {
                    Picker("Select an area", selection: $selectedArea){
                        ForEach(fetchedArea, id: \.self){ (area: AreaEntity) in
                            Text(area.nameArea!).tag(area as AreaEntity?)
                        }
                    }
                }
                
                if habitVM.habitItem != nil {
                    Section(header: Text("Date of creation")) {
                        Text(habitVM.createdDateHabitSave, style: .date)
                    }
                }
                
                
            }.dismissingKeyboard()
            
                .navigationTitle(habitVM.habitItem == nil ? "New Habit" : "Edit")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        Button(action: {
                            habitVM.createHabit(context: viewContext, selectedArea: selectedArea!)
                            self.isNewHabit.toggle()
                        }) {
                            Text(habitVM.habitItem == nil ? "Save" : "Update")
                        }.disabled(disableForm)
                    }
                    
                    ToolbarItemGroup(placement: .navigationBarLeading) {
                        Button(action: {
                            self.isNewHabit.toggle()
                        }) {
                            Text("Cancel").bold()
                                .foregroundColor(Color.blue)
                        }
                    }
                }
        }
    }
}

struct HabitNewIView_Previews: PreviewProvider {
    static var previews: some View {
        HabitNewView(isNewHabit: .constant(false))
    }
}
