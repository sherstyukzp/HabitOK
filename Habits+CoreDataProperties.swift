//
//  Habits+CoreDataProperties.swift
//  HabitOK
//
//  Created by Ярослав Шерстюк on 05.04.2021.
//
//

import Foundation
import CoreData


extension Habits {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Habits> {
        return NSFetchRequest<Habits>(entityName: "Habits")
    }

    @NSManaged public var dateStartHabit: Date?
    @NSManaged public var idHabit: UUID?
    @NSManaged public var nameHabit: String?
    @NSManaged public var noteHabit: String?
    @NSManaged public var statusHabit: Bool
    @NSManaged public var targetHabit: Double
    @NSManaged public var timeOfDayHabit: String?
    @NSManaged public var areas: Areas?

}

extension Habits : Identifiable {

}
