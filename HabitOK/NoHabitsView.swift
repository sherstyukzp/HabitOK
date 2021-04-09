//
//  NoHabitsView.swift
//  HabitOK
//
//  Created by Ярослав Шерстюк on 29.03.2021.
//

import SwiftUI

struct NoHabitsView: View {
    
    @State private var selectedDate: Date = Date()
    @State private var showDatePicker: Bool = false
    
    var body: some View {
        NavigationView {
            
            VStack {
                if showDatePicker {
                    // DatePicker
                    VStack {
                        Divider()
                        DatePicker("", selection: $selectedDate, displayedComponents: [.date])
                            .datePickerStyle(GraphicalDatePickerStyle())
                            .onChange(of: selectedDate, perform: { value in
                                showDatePicker = false
                            })
                        
                        Divider()
                        
                    }.background(Color(.secondarySystemBackground))
                }
                
                VStack {
                    Image(systemName: "tray.2.fill")
                        .font(.system(size: 80))
                        .foregroundColor(.gray)
                    Text("No Habits!")
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding()
                    Text("You still have no habits. Let's create the first? To do this, go to Settings - Area manager and create a habit.")
                        .font(.subheadline)
                        .foregroundColor(Color.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 30.0)
                    
                }
                
                
            }
            
            
            .navigationTitle(Text("Habits"))
            .navigationBarItems(leading:
                                    HStack {
                                        Button(action: {
                                            print("👉 button pressed Calendar...")
                                            self.showDatePicker.toggle()
                                            
                                        }) { Image(systemName: "calendar")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                        }
                                        
                                        Text("\(selectedDate, formatter: ItemFormatter.init().itemFormatterDayOfTheWeekDayOfTheMonthAndMonth)")
                                            .font(.body)
                                            .foregroundColor(Color(.systemGray))
                                        
                                        Spacer()
                                        
                                    })
        }
    }
}

struct NoHabitsView_Previews: PreviewProvider {
    static var previews: some View {
        NoHabitsView()
    }
}
