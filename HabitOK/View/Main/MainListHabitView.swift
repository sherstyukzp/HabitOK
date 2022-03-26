//
//  MainListHabitView.swift
//  HabitOK
//
//  Created by Ярослав Шерстюк on 25.03.2022.
//

import SwiftUI

struct MainListHabitView: View {
    
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(sortDescriptors: [SortDescriptor(\.nameHabit, order: .forward)])
    private var fetchedHabit: FetchedResults<HabitEntity>
    
    
    var body: some View {
        List {
            ForEach(fetchedHabit) { habit in
                MainHabitCallView(habitItem: habit)
            }
        }
    }
}

struct MainListHabitView_Previews: PreviewProvider {
    static var previews: some View {
        MainListHabitView()
    }
}
