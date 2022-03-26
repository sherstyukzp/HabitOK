//
//  MainHabitCallView.swift
//  HabitOK
//
//  Created by Ярослав Шерстюк on 25.03.2022.
//

import SwiftUI

struct MainHabitCallView: View {
    
    @Environment(\.managedObjectContext) var viewContext
    
    @EnvironmentObject var logVM: LogViewModel
    
    @ObservedObject var habitItem: HabitEntity
    
    @State private var checked = false
    
    var body: some View {
        HStack {
            Button(action: {
                self.checked.toggle()
                
                if checked == true {
                    logVM.valueLogSave = 1
                    logVM.createdDateLogSave = Date()
                    logVM.createLog(context: viewContext, selectedHabit: habitItem)
                }
            }) {
                Image(systemName: self.checked ? "checkmark.circle.fill" :  "circle")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(Color((habitItem.habitToArea?.colorArea)!))
                
            }
            .buttonStyle(PlainButtonStyle())
            .background(Color(red: 0, green: 0, blue: 0, opacity: 0.02))
            .cornerRadius(0)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(habitItem.nameHabit ?? "")
                        .font(.title)
                        .padding(0)
                    Text("\(logVM.valueLogSave)")
                        .padding(0)
                }
            }
        }
    }
}


struct MainHabitCallView_Previews: PreviewProvider {
    static var previews: some View {
        MainHabitCallView(habitItem: HabitEntity())
    }
}
