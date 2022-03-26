//
//  HabitViewModel.swift
//  HabitOK
//
//  Created by Ярослав Шерстюк on 25.03.2022.
//

import Foundation
import CoreData
import UIKit

class HabitViewModel: ObservableObject {
    
    @Published var nameHabitSave: String = ""
    
    @Published var isArchivedHabitSave: Bool = false
    @Published var isCompletedHabitSave: Bool = false
    
    @Published var startDateHabitSave: Date = Date()
    @Published var createdDateHabitSave: Date = Date()

    @Published var timeOfDayHabitSave: String = "" // Enum
    @Published var recurrenceHabitSave: String = "" // Enum
    
    @Published var habitItem: HabitEntity!
    
    
    func createHabit(context: NSManagedObjectContext, selectedArea: AreaEntity) {
        
        if habitItem == nil {
            let habit = HabitEntity(context: context)
            
            habit.idHabit = UUID()
            habit.nameHabit = nameHabitSave
            
            habit.startDateHabit = startDateHabitSave
            habit.createdDateHabit = createdDateHabitSave
            // timeOfDayHabitSave
            // recurrenceHabitSave
            habit.habitToArea = selectedArea
            
        } else {
            habitItem.nameHabit = nameHabitSave
            habitItem.startDateHabit = startDateHabitSave
            habitItem.createdDateHabit = createdDateHabitSave
            
            habitItem.habitToArea = selectedArea
        }
        
        save(context: context)
        
        nameHabitSave = ""
        startDateHabitSave = Date()
        createdDateHabitSave = Date()
    }
    
    
    func delete(habit: HabitEntity, context: NSManagedObjectContext){
        context.delete(habit)
        save(context: context)
    }
    
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
        } catch {
            print("🆘 Ошибка сохранения Habit \(error.localizedDescription)")
        }
    }
    
    
}

