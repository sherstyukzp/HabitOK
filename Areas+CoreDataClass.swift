//
//  Areas+CoreDataClass.swift
//  HabitOK
//
//  Created by Ярослав Шерстюк on 05.04.2021.
//
//

import Foundation
import CoreData

@objc(Areas)
public class Areas: NSManagedObject {
    public var wrappedName: String {
        nameArea ?? "Unknown name"
    }
    
    public var habitArray: [Habits] {
        let set = habits as? Set<Habits> ?? []
        return set.sorted()
    }

}
