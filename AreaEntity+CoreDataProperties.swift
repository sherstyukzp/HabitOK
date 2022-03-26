//
//  AreaEntity+CoreDataProperties.swift
//  HabitOK
//
//  Created by Ярослав Шерстюк on 25.03.2022.
//
//

import Foundation
import CoreData


extension AreaEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AreaEntity> {
        return NSFetchRequest<AreaEntity>(entityName: "AreaEntity")
    }

    @NSManaged public var nameArea: String?
    @NSManaged public var colorArea: String?
    @NSManaged public var iconArea: String?
    @NSManaged public var idArea: UUID?
    @NSManaged public var dateCreatedArea: Date?
    @NSManaged public var areaToHabit: Set<HabitEntity>?

    public var habit: [HabitEntity] {
            let setOfHabit = areaToHabit ?? []
        return setOfHabit.sorted {
                $0.id > $1.id
            }
    }
    
}

// MARK: Generated accessors for areaToHabit
extension AreaEntity {

    @objc(addAreaToHabitObject:)
    @NSManaged public func addToAreaToHabit(_ value: HabitEntity)

    @objc(removeAreaToHabitObject:)
    @NSManaged public func removeFromAreaToHabit(_ value: HabitEntity)

    @objc(addAreaToHabit:)
    @NSManaged public func addToAreaToHabit(_ values: NSSet)

    @objc(removeAreaToHabit:)
    @NSManaged public func removeFromAreaToHabit(_ values: NSSet)

}

extension AreaEntity : Identifiable {

}
