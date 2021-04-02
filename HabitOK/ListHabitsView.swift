//
//  ListHabitsView.swift
//  HabitOK
//
//  Created by Ярослав Шерстюк on 02.04.2021.
//

import SwiftUI

struct ListHabitsView: View {
    
    @State private var showingAddHabit = false
    
    var body: some View {
        VStack {
            Text("Habits management")
        }
        
        
        .navigationTitle(Text("Habits"))
        .navigationBarItems(trailing:
                                Button(action: {
                                    self.showingAddHabit.toggle()
                                }) {
                                    Text ("New")
                                }
        )
        .sheet(isPresented: $showingAddHabit) {
            AddNewHabitView()
        }
    }
}

struct ListHabitsView_Previews: PreviewProvider {
    static var previews: some View {
        ListHabitsView()
    }
}
