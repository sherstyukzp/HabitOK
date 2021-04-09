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
    
    
    var body: some View {
        
        VStack {
            if habits.count == 0 {
                VStack {
                    Image(systemName: "tray.2.fill")
                        .font(.system(size: 80))
                        .foregroundColor(.gray)
                    Text("No Habits!")
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding()
                    Text("You still have no habits. Let's create the first? To do this, go to Settings - Area manager and create a habit.")
                        .font(.subheadline)
                        .foregroundColor(Color.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 30.0)
                    
                }
                
            } else {
                List {
                    ForEach(self.habits, id:\.self) { (habit: Habits) in
                        Text("\(habit.wrappedName)")
                        
                    }
                    
                    .onDelete(perform: deleteHabit(at:))
                }.listStyle(GroupedListStyle())
                }
            
        }
        
        .navigationTitle(Text("Habits"))
        
        
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
