//
//  NoHabitsView.swift
//  HabitOK
//
//  Created by Ярослав Шерстюк on 29.03.2021.
//

import SwiftUI

struct NoHabitsView: View {
    @State private var selectedDate: Date = Date()
    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "tray.2.fill")
                    .font(.system(size: 80))
                    .foregroundColor(.gray)
                Text("No Habits!")
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding()
                Text("You still have no habits. Let's create the first? To do this, click the Plus button.")
                    .font(.subheadline)
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 30.0)
                
            }
            
            .navigationTitle(Text("Habits"))
            .navigationBarItems(leading:
                                    HStack {
                                        Button(action: {
                                            print("👉 button pressed Calendar...")
                                            
                                        }) { Image(systemName: "calendar")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                        }
                                        Spacer()
                                        Text("\(selectedDate, formatter: ItemFormatter.init().itemFormatterDayOfTheWeekDayOfTheMonthAndMonth)")
                                            .font(.body)
                                            .foregroundColor(Color(.systemGray))
                                        
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

struct NoHabitsView_Previews: PreviewProvider {
    static var previews: some View {
        NoHabitsView()
    }
}
