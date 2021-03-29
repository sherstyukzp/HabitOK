//
//  HabitsView.swift
//  HabitOK
//
//  Created by Ярослав Шерстюк on 29.03.2021.
//

import SwiftUI

struct HabitsView: View {
    
    //@ObservedObject var dateModelController = DateModelController()
    @State var currentDate: Date = Date()
    @State private var isShowCalendar = false
    
    var body: some View {
        NavigationView {
            VStack {
                
                if isShowCalendar {
                    Form {
                        DatePicker("Select Date", selection: $currentDate, 
                                   displayedComponents: .date)
                            .datePickerStyle(GraphicalDatePickerStyle())
                            
                        //Spacer()
                        
                    }
                    .onAppear {
                    self.dismissKeyboard()
                 }
                
                }
                
            }
            
                //
                //            VStack {
                //                Text("Please choose a delivery date.")
                //                ScrollView(.horizontal, showsIndicators: false, content: {
                //                    HStack(spacing: 10) {
                //                        ForEach(dateModelController.listOfValidDates, id: \.self) { date in
                //                            GridView(date: date).onTapGesture {
                //                                print("👉 onTapGesture \(self.dateModelController.selectedDate)")
                //                                self.dateModelController.toggleIsSelected(date: date)
                //                            }
                //                        }
                //                    }
                //                })
                //                HStack {
                //                    Text("Your scheduled delivery date is: ")
                //                    Text("\(self.dateModelController.selectedDate)").foregroundColor(.red).bold()
                //                }.padding(.top, 20)
                //                Spacer()
                //            }.padding().padding(.top, 30)
                //
                
                
                //
            
            
                
                //
                .navigationBarTitle("Habits", displayMode: .large)
                .navigationBarItems(leading:
                                        HStack {
                                            Button(action: {
                                                print("👉 button pressed Calendar...")
                                                self.isShowCalendar.toggle()
                                                
                                            }) { Image(systemName: "calendar")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                            }
                                            
                                            Text("\(currentDate, formatter: ItemFormatter.init().itemFormatterDayOfTheWeekDayOfTheMonthAndMonth)")
                                                .font(.body)
                                                .foregroundColor(Color(.systemGray))
                                            Spacer()
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
    
    func dismissKeyboard() {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
}

struct HabitsView_Previews: PreviewProvider {
    static var previews: some View {
        HabitsView()
    }
}
