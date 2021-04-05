//
//  HabitView.swift
//  HabitOK
//
//  Created by Ярослав Шерстюк on 05.04.2021.
//

import SwiftUI

struct HabitView: View {
    
    @Environment(\.managedObjectContext) var moc
    @ObservedObject var habits: Habits
    
    var body: some View {
        Text("\(self.habits.wrappedName)")
    }
}

//struct HabitView_Previews: PreviewProvider {
//    static var previews: some View {
//        HabitView()
//    }
//}
