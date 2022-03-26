//
//  SettingsView.swift
//  HabitOK
//
//  Created by Ярослав Шерстюк on 25.03.2022.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        Form {
            Section (header: HeaderSettingView(imageIcon: "slider.horizontal.3", text: "Management")) {
                NavigationLink("Areas Management") {
                    AreasListView()
                }
                
                NavigationLink("Logs") {
                    LogListView()
                }
                
            }
        }
        .navigationTitle(Text("Settings"))
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
