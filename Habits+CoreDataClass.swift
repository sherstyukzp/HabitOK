//
//  Habits+CoreDataClass.swift
//  HabitOK
//
//  Created by Ярослав Шерстюк on 05.04.2021.
//
//

import Foundation
import CoreData

@objc(Habits)
public class Habits: NSManagedObject {
    public var wrappedName: String {
        nameHabit ?? "Unknown attribute"
    }

}

extension Habits: Comparable {
    public static func < (lhs: Habits, rhs: Habits) -> Bool {
        lhs.wrappedName < rhs.wrappedName
    }
}
