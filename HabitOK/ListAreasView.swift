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
        VStack {
            
            if areas.count == 0 {
                
                VStack {
                    Image(systemName: "tray.2.fill")
                        .font(.system(size: 80))
                        .foregroundColor(.gray)
                    Text("No Areas!")
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding()
                    Text("You still don't have an area. Let's create the first one? To do this, click ''New Area'' and fill in the fields. The area can be your work, family, health, etc.")
                        .font(.subheadline)
                        .foregroundColor(Color.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 30.0)
                    
                }
                
            } else {
                
                List {
                    ForEach(self.areas, id:\.self) { (area: Areas) in
                        NavigationLink(destination:
                                        AreaDetailView(area: area).environment(\.managedObjectContext, self.moc))
                        {
                            VStack(alignment: .leading) {
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
                
            }
            
        }
        
        .navigationTitle(Text("Areas"))
        .navigationBarItems(trailing:
                                Button(action: {
                                    self.showingAddArea.toggle()
                                }) {
                                    Text ("New Area")
                                }
        )
        .sheet(isPresented: $showingAddArea) {
            AddNewAreaView()
        }
        
    }
    
    // MARK: - Метод удаления выбраной Области
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
