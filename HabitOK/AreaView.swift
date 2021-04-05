//
//  AreaView.swift
//  HabitOK
//
//  Created by Ярослав Шерстюк on 05.04.2021.
//

import SwiftUI

struct AreaView: View {
    
    @Environment(\.managedObjectContext) var moc
    @ObservedObject var area: Areas
    
    var body: some View {
        VStack {
            Text("\(self.area.wrappedName)")
        }
    }
}

//struct AreaView_Previews: PreviewProvider {
//    static var previews: some View {
//        AreaView()
//    }
//}
