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
                NavigationLink(destination:
                                AreaDetailView(area: area).environment(\.managedObjectContext, self.moc))
                {
                    VStack (alignment: .leading){
                        Text("Area: \(area.wrappedName)")
                            .font(.largeTitle)
                        Text("Total habits: \(area.habitArray.count)")
                            .font(.footnote)
                            .foregroundColor(.secondary)
                    }
                    
                }
            }
            
            .onDelete(perform: deleteArea(at:))
        }.listStyle(GroupedListStyle())
        
        
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
    
    // MARK: - Метод удаления выбраной записи жарнала
    func deleteArea(at offsets: IndexSet) {
        for index in offsets {
            let area = areas[index]
            moc.delete(area)
        }
        try? moc.save()
    }
    
}

struct ListAreasView_Previews: PreviewProvider {
    static var previews: some View {
        ListAreasView()
    }
}
