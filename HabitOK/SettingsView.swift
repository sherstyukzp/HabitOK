//
//  SettingsView.swift
//  HabitOK
//
//  Created by Ярослав Шерстюк on 29.03.2021.
//

import SwiftUI

struct SettingsView: View {
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Management")){
                    
                    NavigationLink(destination: ListAreasView()) {
                        Text("Areas management")
                    }
                    
                    NavigationLink(destination: ListHabitsView()) {
                        Text("Habits management")
                    }
                }
            }
            
            .navigationTitle(Text("Settings"))
            
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
