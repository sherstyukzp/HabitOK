//
//  AreaViewModel.swift
//  HabitOK
//
//  Created by Ярослав Шерстюк on 25.03.2022.
//

import Foundation
import CoreData

class AreaViewModel: ObservableObject {
    
    @Published var nameAreaSave: String = ""
    @Published var iconAreaSave: String = "creditcard.fill"
    @Published var colorAreaSave = "swatch_articblue"
    @Published var dateCreatedAreaSave: Date = Date()
    
    @Published var areaItem: AreaEntity!
    
    func createArea(context: NSManagedObjectContext) {
        
        if areaItem == nil {
            let area = AreaEntity(context: context)
            
            area.idArea = UUID()
            area.nameArea = nameAreaSave
            area.iconArea = iconAreaSave
            area.colorArea = colorAreaSave
            area.dateCreatedArea = Date()
            
        } else {
            areaItem.nameArea = nameAreaSave
            areaItem.iconArea = iconAreaSave
            areaItem.colorArea = colorAreaSave
            
        }
        
        save(context: context)
        
        nameAreaSave = ""
        iconAreaSave = ""
        colorAreaSave = ""
    }
    

    func editAccount(area: AreaEntity){
        areaItem = area
    }
    
    func delete(area: AreaEntity, context: NSManagedObjectContext){
        context.delete(area)
        save(context: context)
    }
    
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
        } catch {
            print("🆘 Ошибка сохранения Area \(error.localizedDescription)")
        }
    }
    
    
}

