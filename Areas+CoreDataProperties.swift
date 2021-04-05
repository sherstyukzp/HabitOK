//
//  Areas+CoreDataProperties.swift
//  HabitOK
//
//  Created by Ярослав Шерстюк on 05.04.2021.
//
//

import Foundation
import CoreData


extension Areas {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Areas> {
        return NSFetchRequest<Areas>(entityName: "Areas")
    }

    @NSManaged public var iconArea: String?
    @NSManaged public var idArea: UUID?
    @NSManaged public var nameArea: String?
    @NSManaged public var habits: NSSet?

}

// MARK: Generated accessors for habits
extension Areas {

    @objc(addHabitsObject:)
    @NSManaged public func addToHabits(_ value: Habits)

    @objc(removeHabitsObject:)
    @NSManaged public func removeFromHabits(_ value: Habits)

    @objc(addHabits:)
    @NSManaged public func addToHabits(_ values: NSSet)

    @objc(removeHabits:)
    @NSManaged public func removeFromHabits(_ values: NSSet)

}

extension Areas : Identifiable {

}
