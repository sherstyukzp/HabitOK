//
//  AreasListView.swift
//  HabitOK
//
//  Created by Ярослав Шерстюк on 25.03.2022.
//

import SwiftUI

struct AreasListView: View {
    
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\AreaEntity.nameArea, order: .reverse)
    ]) var fetchedArea: FetchedResults<AreaEntity>
    
    @State private var isNewArea = false
    
    var body: some View {
        
        List {
            ForEach(fetchedArea) { item in
                AreaCallView(areaItem: item)
            }
            
            .navigationTitle(Text("Areas"))
            
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button{
                    self.isNewArea.toggle()
                } label: {
                    Text("New Area")
                }
            }
        }
        
        .sheet(isPresented: $isNewArea) {
            AreaNewView(isNewArea: $isNewArea)
        }
    }
}

struct AreasListView_Previews: PreviewProvider {
    static var previews: some View {
        AreasListView()
    }
}
