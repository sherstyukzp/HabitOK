//
//  AreaCallView.swift
//  HabitOK
//
//  Created by Ярослав Шерстюк on 25.03.2022.
//

import SwiftUI

struct AreaCallView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @EnvironmentObject var areaVM: AreaViewModel
    @ObservedObject var areaItem: AreaEntity
    
    // Alert
    @State var showAlert: Bool = false
    @State var alertTitle: String = "Deleting a Area"
    @State var alertMessage: String = "Are you sure you want to delete the Area?"
    
    @State var isEditArea: Bool = false
    
    var body: some View {
        HStack {
            ZStack {
                Circle()
                    .fill(Color((areaItem.colorArea) ?? "swatch_gunsmoke"))
                    .frame(width: 32, height: 32)
                Image(systemName: areaItem.iconArea ?? "plus")
                    .foregroundColor(Color.white)
                    .font(Font.footnote)
            }
            
            VStack(alignment: .leading) {
                Text(areaItem.nameArea ?? "no name")
                    .bold()
                    .foregroundColor(.primary)
                Text("Created: \(areaItem.dateCreatedArea ?? Date(), style: .date)")
                    .foregroundColor(.secondary)
            }
        }
        .swipeActions(edge: .trailing, allowsFullSwipe: false) {
            Button(role: .destructive) {
                showAlert.toggle()
            } label: {
                Label("Delete", systemImage: "trash")
            }
            
            Button {
                areaVM.nameAreaSave = areaItem.nameArea!
                areaVM.iconAreaSave = areaItem.iconArea!
                areaVM.colorAreaSave = areaItem.colorArea!
                areaVM.areaItem = areaItem
                self.isEditArea.toggle()
            } label: {
                Label("Edit", systemImage: "pencil")
            }.tint(.yellow)
            
        }
        
        .alert(isPresented: $showAlert) {
            getAlert()
        }
        
        .sheet(isPresented: $isEditArea) {
            AreaNewView(isNewArea: $isEditArea)
        }
        
    }
    
    // MARK: Alert
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle),
                     message: Text(alertMessage),
                     primaryButton: .destructive(Text("Yes"),
                                                 action: {
            areaVM.delete(area: areaItem, context: viewContext)
        }),
                     secondaryButton: .cancel())
    }
    
}

struct AreaCallView_Previews: PreviewProvider {
    static var previews: some View {
        AreaCallView(areaItem: AreaEntity())
    }
}
