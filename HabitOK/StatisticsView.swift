//
//  StatisticsView.swift
//  HabitOK
//
//  Created by Ярослав Шерстюк on 29.03.2021.
//

import SwiftUI

struct StatisticsView: View {
    
    
    @State var selectedDate: Date = Date()
    @State var showDatePicker: Bool = false
    
    var body: some View {
        
        NavigationView {
            Text("Statistics")
                .navigationTitle(Text("Statistics"))
            
        }
        
        
        
        
        
        
        
    }
}

struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView()
    }
}
