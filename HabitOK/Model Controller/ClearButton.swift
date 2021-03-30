//
//  ClearButton.swift
//  HabitOK
//
//  Created by Ярослав Шерстюк on 30.03.2021.
//

import SwiftUI

// Добавление в TextField кнопки для удаления введённых значений
public struct ClearButton: ViewModifier {
    @Binding var text: String
    
    public init(text: Binding<String>) {
        self._text = text
    }
    
    public func body(content: Content) -> some View {
        HStack {
            content
            Spacer()
            // onTapGesture is better than a Button here when adding to a form
            Image(systemName: "delete.left")
                .foregroundColor(.secondary)
                .opacity(text == "" ? 0 : 1)
                .onTapGesture { self.text = "" }
        }
    }
}
