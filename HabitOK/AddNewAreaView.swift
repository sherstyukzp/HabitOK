//
//  AddNewAreaView.swift
//  HabitOK
//
//  Created by Ярослав Шерстюк on 02.04.2021.
//

import SwiftUI

struct AddNewAreaView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Add New Area")
            }
            
            .navigationBarTitle("New Area", displayMode: .large)
            .navigationBarItems(leading:
                                    Button("Cancel") {
                                        self.presentationMode.projectedValue.wrappedValue.dismiss()
                                    }
                                
            )
        }
    }
}

struct AddNewAreaView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewAreaView()
    }
}
