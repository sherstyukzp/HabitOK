//
//  LogViewModel.swift
//  HabitOK
//
//  Created by Ярослав Шерстюк on 26.03.2022.
//

import Foundation
import CoreData
import UIKit

class LogViewModel: ObservableObject {
    
    @Published var unitTypeLogSave: String = ""
    @Published var valueLogSave: Double = 0.0
    @Published var targetDateLogSave: Date = Date()
    @Published var createdDateLogSave: Date = Date()
    
    @Published var logItem: LogsEntity!
    
    
    func createLog(context: NSManagedObjectContext, selectedHabit: HabitEntity) {
        
        if logItem == nil {
            let log = LogsEntity(context: context)
            
            log.idLog = UUID()
            log.valueLog = valueLogSave
            
            log.targetDateLog = targetDateLogSave
            log.createdDateLog = createdDateLogSave
            log.logToHabit = selectedHabit
            
            print("👉 valueLog \(valueLogSave) \(selectedHabit.nameHabit)")
        } else {
            logItem.valueLog = valueLogSave
            logItem.targetDateLog = targetDateLogSave
            logItem.createdDateLog = createdDateLogSave
            
            logItem.logToHabit = selectedHabit
        }
        
        save(context: context)
        
        valueLogSave = 0.0
        targetDateLogSave = Date()
        createdDateLogSave = Date()
    }
    
    
    func delete(log: LogsEntity, context: NSManagedObjectContext){
        context.delete(log)
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

