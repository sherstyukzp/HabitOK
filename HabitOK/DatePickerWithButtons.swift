//
//  DatePickerWithButtons.swift
//  HabitOK
//
//  Created by Ярослав Шерстюк on 30.03.2021.
//

import SwiftUI


struct DatePickerWithButtons: View {
    
    @Binding var showDatePicker: Bool
    @Binding var savedDate: Date?
    @State var selectedDate: Date = Date()
    
    var body: some View {
        ZStack {
            Color(UIColor.systemGray).opacity(0.3)
                .edgesIgnoringSafeArea(.all)
           
            ZStack {
                
                VStack {
                    Text("Select Date")
                    DatePicker("Test", selection: $selectedDate, displayedComponents: [.date])
                        .datePickerStyle(GraphicalDatePickerStyle())
                    
                    Divider()
                    // Button
                    HStack {
                        
                        Button(action: {
                            showDatePicker = false
                        }, label: {
                            Text("Cancel")
                        })
                        
                        Spacer()
                        
                        Button(action: {
                            savedDate = selectedDate
                            showDatePicker = false
                        }, label: {
                            Text("Select".uppercased())
                                .bold()
                        })
                        
                    }
                    .padding(.horizontal)
                    
                    
                }
                .padding()
                .background (
                    Color(UIColor.systemBackground)
                        .cornerRadius(10)
                )
                .cornerRadius(10)
                .padding()
            }
            
        }
        
        
        
    }
}

