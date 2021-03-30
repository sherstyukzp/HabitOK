//
//  HabitsView.swift
//  HabitOK
//
//  Created by Ярослав Шерстюк on 29.03.2021.
//

import SwiftUI

struct HabitsView: View {
    
    //@State private var selectedDate: Date = Date()
    
    @State var showDatePicker: Bool = false
    @State var savedDate: Date? = Date()
    
    var body: some View {
        
        NavigationView {
            
            
            
            VStack {
                ZStack {
                    
                    List(0..<15) { item in
                        Text("Hello World !")
                    }
                    
                    if showDatePicker {
                        DatePickerWithButtons(showDatePicker: $showDatePicker, savedDate: $savedDate, selectedDate: savedDate ?? Date())
                        
                    }
                }
                
            }
            
            .navigationBarTitle("Habits", displayMode: .large)
            .navigationBarItems(leading:
                                    HStack {
                                        Button(action: {
                                            print("👉 button pressed Calendar...")
                                            self.showDatePicker.toggle()
                                            
                                        }) { Image(systemName: "calendar")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                        }
                                        Spacer()
                                        Text("\(savedDate!, formatter: ItemFormatter.init().itemFormatterDayOfTheWeekDayOfTheMonthAndMonth)")
                                            .font(.body)
                                            .foregroundColor(Color(.systemGray))
                                            .onTapGesture {
                                                showDatePicker.toggle()
                                            }
                                    }, trailing:
                                        HStack {
                                            Button(action: {
                                                print("👉 button pressed Plus...")
                                            }) { Image(systemName: "plus.circle.fill")
                                                .resizable()
                                                .frame(width: 40, height: 40)
                                                
                                            }
                                        }
                                
            )
            
        }
        
        
        
    }
    
    
    
}





struct HabitsView_Previews: PreviewProvider {
    static var previews: some View {
        HabitsView()
    }
}


