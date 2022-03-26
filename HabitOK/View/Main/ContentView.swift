//
//  ContentView.swift
//  HabitOK
//
//  Created by Ярослав Шерстюк on 25.03.2022.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(sortDescriptors: [SortDescriptor(\.nameArea, order: .forward)])
    private var fetchedArea: FetchedResults<AreaEntity>
    
    @State private var isNewArea = false
    @State private var isNewHabit = false
    
    var body: some View {
        NavigationView {
            VStack {
                if fetchedArea.count == 0 {
                    NotAreaView()
                }
                else {
                    MainListHabitView()
                }
                
            }
            
            .navigationTitle(Text("My habits"))
            .toolbar {
                // Кнопка Настройки в NavigationView
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink(destination: SettingsView()) {
                        Image(systemName: "gearshape")
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    
                    Menu {
                        Button{
                            self.isNewArea.toggle()
                        } label: {
                            Label("New Area", systemImage: "plus.circle")
                        }
                        
                        if fetchedArea.count != 0 {
                            Button{
                                self.isNewHabit.toggle()
                            } label: {
                                Label("New Habit", systemImage: "plus.circle")
                            }
                        }
                        
                        
                    } label: {
                        Label("Menu", systemImage: "ellipsis.circle")
                    }
                }
            }
            
            .sheet(isPresented: $isNewArea) {
                AreaNewView(isNewArea: $isNewArea)
            }
            .sheet(isPresented: $isNewHabit) {
                HabitNewView(isNewHabit: $isNewHabit)
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
