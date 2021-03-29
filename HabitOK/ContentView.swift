//
//  ContentView.swift
//  HabitOK
//
//  Created by Ярослав Шерстюк on 22.03.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            
            TabBarContentView()
                
                .navigationTitle(Text("Today"))
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
