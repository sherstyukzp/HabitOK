//
//  LogsEntity+CoreDataProperties.swift
//  HabitOK
//
//  Created by Ярослав Шерстюк on 25.03.2022.
//
//

import Foundation
import CoreData


extension LogsEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LogsEntity> {
        return NSFetchRequest<LogsEntity>(entityName: "LogsEntity")
    }

    @NSManaged public var idLog: UUID?
    @NSManaged public var createdDateLog: Date?
    @NSManaged public var targetDateLog: Date?
    @NSManaged public var unitTypeLog: String?
    @NSManaged public var valueLog: Double
    
    @NSManaged public var logToHabit: HabitEntity?

}

extension LogsEntity : Identifiable {

}
