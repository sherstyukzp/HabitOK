//
//  HabitsView.swift
//  HabitOK
//
//  Created by Ярослав Шерстюк on 29.03.2021.
//

import SwiftUI

struct HabitsView: View {
    
    @State private var selectedDate: Date = Date()
    @State private var showDatePicker: Bool = false
    
    var body: some View {
        
        VStack {
            // NavigationBar
            VStack (spacing: 5) {
                HStack {
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
                            .onTapGesture {
                                showDatePicker.toggle()
                            }
                        
                    }.padding(.horizontal)
                    Spacer()
                    HStack {
                        Button(action: {
                            print("👉 button pressed Plus...")
                        }) { Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            
                        }
                    }.padding(.horizontal)
                    
                }
                HStack{
                    Text("Habits")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal)
                    Spacer()
                }
                Divider()
                
                if showDatePicker {
                    // DatePicker
                    VStack {
                        DatePicker("", selection: $selectedDate, displayedComponents: [.date])
                            .datePickerStyle(GraphicalDatePickerStyle())
                            .onChange(of: selectedDate, perform: { value in
                                showDatePicker = false
                            })
                        
                        Divider()
                        
                    }
                }
            }
            
            List(0..<15) { item in
                Text("Hello World !")
            }
        }
        
        
        
    }
    
    
    
}





struct HabitsView_Previews: PreviewProvider {
    static var previews: some View {
        HabitsView()
    }
}


