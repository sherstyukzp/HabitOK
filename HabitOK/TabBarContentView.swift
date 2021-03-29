//
//  TabBarContentView.swift
//  HabitOK
//
//  Created by Ярослав Шерстюк on 29.03.2021.
//

import SwiftUI

struct TabBarContentView: View {
    
    @State private var habitsCount = 1
    var body: some View {
        TabView {
            if habitsCount == 0 {
                NoHabitsView()
                    .tabItem {
                        Image(systemName: "chart.bar.doc.horizontal.fill")
                        Text("Habits")
                    }
            } else {
                HabitsView()
                    .tabItem {
                        Image(systemName: "chart.bar.doc.horizontal.fill")
                        Text("Habits")
                    }
            }
            StatisticsView()
                .tabItem {
                    Image(systemName: "chart.pie.fill")
                    Text("Statistics")
                }
            SettingsView()
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("Settings")
                }
        }
    }
}

struct TabBarContentView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarContentView()
    }
}
