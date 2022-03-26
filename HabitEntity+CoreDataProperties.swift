//
//  HabitEntity+CoreDataProperties.swift
//  HabitOK
//
//  Created by Ярослав Шерстюк on 25.03.2022.
//
//

import Foundation
import CoreData


extension HabitEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<HabitEntity> {
        return NSFetchRequest<HabitEntity>(entityName: "HabitEntity")
    }

    @NSManaged public var nameHabit: String?
    @NSManaged public var createdDateHabit: Date?
    @NSManaged public var isCompletedHabit: Bool
    @NSManaged public var idHabit: UUID?
    @NSManaged public var isArchivedHabit: Bool
    @NSManaged public var startDateHabit: Date?
    @NSManaged public var timeOfDayHabit: String?
    @NSManaged public var recurrenceHabit: String?
    
    @NSManaged public var habitToArea: AreaEntity?
    
    @NSManaged public var habitToLog: Set<HabitEntity>?
    @NSManaged public var habitToNote: Set<HabitEntity>?
    
    public var log: [HabitEntity] {
            let setOfLog = habitToLog ?? []
        return setOfLog.sorted {
                $0.id > $1.id
            }
    }
    
    public var note: [HabitEntity] {
            let setOfNote = habitToNote ?? []
        return setOfNote.sorted {
                $0.id > $1.id
            }
    }

}

// MARK: Generated accessors for habitToLog
extension HabitEntity {

    @objc(addHabitToLogObject:)
    @NSManaged public func addToHabitToLog(_ value: LogsEntity)

    @objc(removeHabitToLogObject:)
    @NSManaged public func removeFromHabitToLog(_ value: LogsEntity)

    @objc(addHabitToLog:)
    @NSManaged public func addToHabitToLog(_ values: NSSet)

    @objc(removeHabitToLog:)
    @NSManaged public func removeFromHabitToLog(_ values: NSSet)

}

// MARK: Generated accessors for habitToNote
extension HabitEntity {

    @objc(addHabitToNoteObject:)
    @NSManaged public func addToHabitToNote(_ value: NotesEntity)

    @objc(removeHabitToNoteObject:)
    @NSManaged public func removeFromHabitToNote(_ value: NotesEntity)

    @objc(addHabitToNote:)
    @NSManaged public func addToHabitToNote(_ values: NSSet)

    @objc(removeHabitToNote:)
    @NSManaged public func removeFromHabitToNote(_ values: NSSet)

}

extension HabitEntity : Identifiable {

}
