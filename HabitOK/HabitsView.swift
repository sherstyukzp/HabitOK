//
//  HabitsView.swift
//  HabitOK
//
//  Created by Ярослав Шерстюк on 29.03.2021.
//

import SwiftUI

struct HabitsView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Habits.entity(), sortDescriptors: [])
    private var habits: FetchedResults<Habits>
    
    @State private var selectedDate: Date = Date()
    @State private var showDatePicker: Bool = false
    @State private var showingFilter = false
    
    
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
                
                List {
                    ForEach(self.habits, id:\.self) { (habit: Habits) in
                        VStack(alignment: .leading) {
                            Text("Habit: \(habit.wrappedName)")
                                .font(.largeTitle)
                            Text("Area: \(habit.areas?.wrappedName ?? "No area")")
                                .font(.footnote)
                                .foregroundColor(.secondary)
                                .background(Color(habit.areas?.colorArea ?? "swatch_shipcove"))
                        }
                    }
                    
                }.listStyle(GroupedListStyle())
                
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
                                        
                                    }
                                , trailing:
                                    Button(action: {
                                        print("👉 button pressed Filter...")
                                        self.showingFilter.toggle()
                                        
                                    }) { Image(systemName: "line.horizontal.3.decrease.circle.fill")
                                        .resizable()
                                        .frame(width: 35, height: 35)
                                    })
        }
        .sheet(isPresented: $showingFilter) {
            FilterView()
        }
        
    }
    
}






struct HabitsView_Previews: PreviewProvider {
    static var previews: some View {
        HabitsView()
    }
}


