//
//  Daily+CoreDataProperties.swift
//  SimpleDaily
//
//  Created by 고정근 on 2022/06/22.
//
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var title: String?
    @NSManaged public var content: String?
    @NSManaged public var imageURL: String?
    @NSManaged public var lastUpdated: Date?

}

extension Note : Identifiable {

}
