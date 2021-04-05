//
//  AreaDetailView.swift
//  HabitOK
//
//  Created by Ярослав Шерстюк on 05.04.2021.
//

import SwiftUI

struct AreaDetailView: View {
    
    @Environment(\.managedObjectContext) var moc
    @ObservedObject var area: Areas
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

//struct AreaDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        AreaDetailView()
//    }
//}
