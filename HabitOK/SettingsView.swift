//
//  SettingsView.swift
//  HabitOK
//
//  Created by Ярослав Шерстюк on 29.03.2021.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    
    var body: some View {
        
        let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
        let buildNumber = Bundle.main.infoDictionary?["CFBundleVersion"] as! String
        
        NavigationView {
            Form {
                Section(header: Text("Management")) {
                    
                    NavigationLink(destination: ListAreasView()) {
                        Text("Areas management")
                    }
                    
                    NavigationLink(destination: ListHabitsView()) {
                        Text("Habits management")
                    }
                }
                
                Section(header: Contact()) {
                    
                    Link("Twitter", destination: URL(string: "https://twitter.com/habit_ok")!)
                    
                    Button(action: {
                        EmailHelper.shared.sendEmail(subject: "HabitOK",
                                                     body: "Version: \(appVersion)",
                                                     to: "habitok.app@gmail.com")
                    }) {
                        Text("Email")
                    }
                }
                
                Section(header: About()) {
                    // MARK: - Кнопка оценить приложение
                    Button(action: {
                        if let windowScene = UIApplication.shared.windows.first?.windowScene { SKStoreReviewController.requestReview(in: windowScene) }
                    }) {
                        Text("Rate app")
                    }
                    
                    // MARK: - Кнопка рассказать другу
                    Button(action: {
                        tellFriend()
                    }) {
                        Text("Share HabitOK")
                    }
                    
                    HStack {
                        Text("Version App")
                        Spacer()
                        Text("\(appVersion) (\(buildNumber))")
                    }
                }
            }
            
            .navigationTitle(Text("Settings"))
            
        }
    }
    
    // MARK: - Рассказать другу
    func tellFriend() {
        
        let text = URL(string: "https://apps.apple.com/ua/app/%D1%82%D0%BE%D0%BF%D0%B8%D0%BA/id1552880676")
        let data = [text]
        let av = UIActivityViewController(activityItems: data as [Any], applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(av, animated: true, completion: nil)
    }
}

struct Contact: View {
    var body: some View {
        HStack {
            Image(systemName: "text.bubble")
            Text("Contact")
        }
    }
}

struct About: View {
    var body: some View {
        HStack {
            Image(systemName: "info.circle")
            Text("About")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
