//
//  ListAreasView.swift
//  HabitOK
//
//  Created by Ярослав Шерстюк on 02.04.2021.
//

import SwiftUI

struct ListAreasView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var showingAddArea = false
    
    var body: some View {
        VStack {
            Text("Area management")
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
