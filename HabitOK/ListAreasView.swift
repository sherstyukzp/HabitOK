//
//  ListAreasView.swift
//  HabitOK
//
//  Created by Ярослав Шерстюк on 02.04.2021.
//

import SwiftUI

struct ListAreasView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(entity: Areas.entity(), sortDescriptors: []) var areas: FetchedResults<Areas>
    
    @State private var showingAddArea = false
    
    var body: some View {
        List {
            ForEach(self.areas, id:\.self) { (area:Areas) in
                NavigationLink(destination: AreaDetailView(area: area).environment(\.managedObjectContext, self.moc)) {
                    AreaView(area: area).environment(\.managedObjectContext, self.moc)
                }
            }
        }
        
        
        .navigationTitle(Text("Areas"))
        .navigationBarItems(trailing:
                                Button(action: {
                                    self.showingAddArea.toggle()
                                }) {
                                    Text ("New")
                                }
        )
        .sheet(isPresented: $showingAddArea) {
            AddNewAreaView()
        }
        
    }
}

struct ListAreasView_Previews: PreviewProvider {
    static var previews: some View {
        ListAreasView()
    }
}
