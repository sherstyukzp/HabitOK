//
//  LogListView.swift
//  HabitOK
//
//  Created by Ярослав Шерстюк on 26.03.2022.
//

import SwiftUI

struct LogListView: View {
    
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(sortDescriptors: [SortDescriptor(\.valueLog, order: .forward)])
    private var fetchedLog: FetchedResults<LogsEntity>
    
    var body: some View {
        List {
            ForEach(fetchedLog) { item in
                VStack {
                    Text("\(item.valueLog)")
                    Text("\(item.logToHabit?.nameHabit ?? "")")
                    Text("\(item.createdDateLog!, style: .date)")
                }
                
            }
        }
    }
}

struct LogListView_Previews: PreviewProvider {
    static var previews: some View {
        LogListView()
    }
}
