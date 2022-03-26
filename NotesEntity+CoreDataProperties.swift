//
//  NotesEntity+CoreDataProperties.swift
//  HabitOK
//
//  Created by Ярослав Шерстюк on 25.03.2022.
//
//

import Foundation
import CoreData


extension NotesEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NotesEntity> {
        return NSFetchRequest<NotesEntity>(entityName: "NotesEntity")
    }

    @NSManaged public var idNote: UUID?
    @NSManaged public var contentNote: String?
    @NSManaged public var createdDateNote: Date?
    @NSManaged public var noteToHabit: HabitEntity?

}

extension NotesEntity : Identifiable {

}
