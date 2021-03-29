//
//  NoHabitsView.swift
//  HabitOK
//
//  Created by Ярослав Шерстюк on 29.03.2021.
//

import SwiftUI

struct NoHabitsView: View {
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
            
        }
    }
}

struct NoHabitsView_Previews: PreviewProvider {
    static var previews: some View {
        NoHabitsView()
    }
}
