//
//  FilterView.swift
//  HabitOK
//
//  Created by Ярослав Шерстюк on 09.04.2021.
//

import SwiftUI

struct FilterView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            HStack {
                Text ("Show completed")
            }
            
            .navigationTitle(Text("Filter"))
            .navigationBarItems(trailing:
                                    HStack {
                                        Button(action: {
                                            
                                            self.presentationMode.projectedValue.wrappedValue.dismiss()
                                            
                                        }) { Text("Cancel")
                                        }
                                    }
            )
        }
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
    }
}
