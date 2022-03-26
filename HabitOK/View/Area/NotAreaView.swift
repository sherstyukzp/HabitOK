//
//  NotAreaView.swift
//  HabitOK
//
//  Created by Ярослав Шерстюк on 25.03.2022.
//

import SwiftUI

struct NotAreaView: View {
    
    @EnvironmentObject var areaVM: AreaViewModel
    
    @State private var isNewArea = false
    
    var body: some View {
        // Если нет счетов отображается пустой экран
        VStack {
            Image(systemName: "tray.2.fill")
                .font(.system(size: 80))
                .foregroundColor(.gray)
            Text("No areas!")
                .font(.title3)
                .fontWeight(.bold)
                .padding()
            Text("To add a new area, click on the button below.")
                .font(.subheadline)
                .foregroundColor(Color.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 30.0)
            Button {
                areaVM.nameAreaSave = ""
                areaVM.areaItem = nil
                self.isNewArea.toggle()
                
            } label: {
                HStack {
                    Image(systemName: "plus.circle.fill").font(.system(size: 22, weight: .bold))
                    Text("New area").bold()
                }
                .frame(width: 200, height: 40)
            }.buttonStyle(.borderedProminent)
                .padding()
        }
        
        .sheet(isPresented: $isNewArea) {
            AreaNewView(isNewArea: $isNewArea)
        }
    }
}

struct NotAreaView_Previews: PreviewProvider {
    static var previews: some View {
        NotAreaView()
    }
}
