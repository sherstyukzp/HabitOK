//
//  HabitOKApp.swift
//  HabitOK
//
//  Created by Ярослав Шерстюк on 25.03.2022.
//

import SwiftUI

@main
struct HabitOKApp: App {
    
    let persistenceController = PersistenceController.shared
    
    @StateObject var areaViewModel = AreaViewModel()
    @StateObject var habitViewModel = HabitViewModel()
    @StateObject var logViewModel = LogViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(areaViewModel)
                .environmentObject(habitViewModel)
                .environmentObject(logViewModel)
        }
    }
}
