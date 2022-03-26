//
//  NoteViewModel.swift
//  HabitOK
//
//  Created by Ярослав Шерстюк on 26.03.2022.
//

import Foundation
import CoreData

class NoteViewModel: ObservableObject {
    
    @Published var contentNoteSave: String = ""
    @Published var createdDateNoteSave: Date = Date()
    
    @Published var noteItem: NotesEntity!
    
    func createNote(context: NSManagedObjectContext, selectedHabit: HabitEntity) {
        
        if noteItem == nil {
            let note = NotesEntity(context: context)
            
            note.idNote = UUID()
            note.contentNote = contentNoteSave
            note.createdDateNote = Date()
            
            note.noteToHabit = selectedHabit
            
        } else {
            noteItem.contentNote = contentNoteSave
            noteItem.noteToHabit = selectedHabit
        }
        
        save(context: context)
        
        contentNoteSave = ""
        createdDateNoteSave = Date()
    }
    

    func editNote(note: NotesEntity){
        noteItem = note
    }
    
    func delete(note: NotesEntity, context: NSManagedObjectContext){
        context.delete(note)
        save(context: context)
    }
    
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
        } catch {
            print("🆘 Ошибка сохранения Area \(error.localizedDescription)")
        }
    }
    
    
}

