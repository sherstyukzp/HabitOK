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
    
    @State private var checked = false
    
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
                        
                        HStack {
                            
                            Checkbox(toggle: self.$checked, text: "")
                            
                            VStack(alignment: .leading) {
                                Text("\(habit.wrappedName)")
                                    .font(.largeTitle)
                                Text("\(habit.areas?.wrappedName ?? "No area")")
                                    .font(.footnote)
                                    .foregroundColor(.secondary)
                            }
                            
                            Spacer()
                            RoundedRectangle(cornerRadius: 5, style: .continuous)
                                .fill(Color(habit.areas?.colorArea ?? "swatch_shipcove"))
                                //.padding()
                                .frame(width: 10, height: 10, alignment: .center)
                            
                            
                        }
                        
                    }
                    
                }.listStyle(InsetGroupedListStyle())
                
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


struct Checkbox: View {
    @Binding var toggle: Bool
    var text: String
    var body: some View {
        Button(action: {
            self.toggle.toggle()
        }) {
            Image(systemName: self.toggle ? "checkmark.circle.fill" :  "circle")
                
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(.blue)
            
            Text(text).padding(0)
        }
        .buttonStyle(PlainButtonStyle())
        .background(Color(red: 0, green: 0, blue: 0, opacity: 0.02))
        .cornerRadius(0)
    }
}



struct HabitsView_Previews: PreviewProvider {
    static var previews: some View {
        HabitsView()
    }
}


