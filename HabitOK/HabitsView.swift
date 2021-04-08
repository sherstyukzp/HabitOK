//
//  HabitsView.swift
//  HabitOK
//
//  Created by Ярослав Шерстюк on 29.03.2021.
//

import SwiftUI

struct HabitsView: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Habits.entity(), sortDescriptors: [])
    private var habits: FetchedResults<Habits>
    
    @State private var selectedDate: Date = Date()
    @State private var showDatePicker: Bool = false
    @State private var showingAddHabit = false
    
    
    var body: some View {
        
        NavigationView {
            
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
                                self.showingAddHabit.toggle()
                            }) {
                                Image(systemName: "plus.circle.fill")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                            }.sheet(isPresented: $showingAddHabit) {
                                AddNewHabitView(area: Areas())
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
            
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        print("👉 button pressed Filters...")
                        //self.showingDeleteAlert = true
                    } label: {
                        Text ("Filters")
                    }
                }
                ToolbarItem(placement: .bottomBar) {
                    Spacer()
                }
                
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        print("👉 button pressed Show completed...")
                        //self.showingDeleteAlert = true
                    } label: {
                        Text ("Show completed")
                    }
                }
            }
            
            .navigationBarHidden(true)
        }
        
    }
    
}





struct HabitsView_Previews: PreviewProvider {
    static var previews: some View {
        HabitsView()
    }
}


