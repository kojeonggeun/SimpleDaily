//
//  CoreDataManager.swift
//  SimpleDaily
//
//  Created by 고정근 on 2022/06/25.
//

import Foundation
import CoreData
import UIKit

class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    let persistentContainer = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer
    
    var viewContext: NSManagedObjectContext {
        return persistentContainer!.viewContext
    }
    
    func save(){
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch {
                print("error -> \(error.localizedDescription)")
            }
        }
    }

}

extension CoreDataManager {
    func createNote() -> Note{
        let note = Note(context: viewContext)
        
        note.title = "테스트\(note.id)"
        note.content = "테스트 내용 \(note.objectID)"
        note.imageURL = ""
        note.lastUpdated = Date()
        
        save()
        
        return note
    }
    
    func fetchNotes() -> [Note]{
        let request: NSFetchRequest<Note> = Note.fetchRequest()
        
        let sortDescriptor = NSSortDescriptor(keyPath: \Note.lastUpdated, ascending: false)
        request.sortDescriptors = [sortDescriptor]
        
        return (try? viewContext.fetch(request)) ?? []
        
    }
}
