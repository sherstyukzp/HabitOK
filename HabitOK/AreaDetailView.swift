//
//  AreaDetailView.swift
//  HabitOK
//
//  Created by Ярослав Шерстюк on 05.04.2021.
//

import SwiftUI

struct AreaDetailView: View {
    
    @Environment(\.managedObjectContext) var moc
    
    @ObservedObject var area: Areas
    
    @State private var showingAddHabit = false
    
    var body: some View {
        
        List {
            ForEach(self.area.habitArray, id: \.self) { habit in
                VStack {
                    Text ("Habit: \(habit.wrappedName)")
                }
            }
            .onDelete(perform: deleteHabit(at:))
        }.listStyle(GroupedListStyle())
        
        .navigationBarTitle(Text("\(self.area.nameArea ?? "No name area")"))
        .navigationBarItems(trailing:
                                Button(action: {
                                    self.showingAddHabit.toggle()
                                }) {
                                    Text ("New Habit")
                                }
        )
        
        .sheet(isPresented: $showingAddHabit) {
            AddNewHabitView(area: area)
        }
        
    }
    
    // MARK: - Метод удаления привычки
    func deleteHabit(at offsets: IndexSet) {
        for index in offsets {
            let habit = area.habitArray[index]
            moc.delete(habit)
        }
        try? moc.save()
    }
}

struct AreaDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AreaDetailView(area: Areas())
    }
}
