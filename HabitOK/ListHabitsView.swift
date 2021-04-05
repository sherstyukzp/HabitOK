//
//  ListHabitsView.swift
//  HabitOK
//
//  Created by Ярослав Шерстюк on 02.04.2021.
//

import SwiftUI

struct ListHabitsView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Habits.entity(), sortDescriptors: [])
    var habits: FetchedResults<Habits>
    
    @State private var showingAddHabit = false
    
    var body: some View {
        List {
            ForEach(self.habits, id:\.self) { (habit: Habits) in
                Text("\(habit.wrappedName)")
                
            }
            
            .onDelete(perform: deleteHabit(at:))
        }.listStyle(GroupedListStyle())
        
        
        .navigationTitle(Text("Habits"))
        .navigationBarItems(trailing:
                                Button(action: {
                                    self.showingAddHabit.toggle()
                                }) {
                                    Text ("New")
                                }
        )
        .sheet(isPresented: $showingAddHabit) {
            AddNewHabitView(area: Areas())
        }
    }
    
    // MARK: - Метод удаления выбраной записи жарнала
    func deleteHabit(at offsets: IndexSet) {
        for index in offsets {
            let habit = habits[index]
            moc.delete(habit)
        }
        try? moc.save()
    }
}

struct ListHabitsView_Previews: PreviewProvider {
    static var previews: some View {
        ListHabitsView()
    }
}
