//
//  Daily+CoreDataProperties.swift
//  SimpleDaily
//
//  Created by 고정근 on 2022/06/22.
//
//

import Foundation
import CoreData


extension Daily {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Daily> {
        return NSFetchRequest<Daily>(entityName: "Daily")
    }

    @NSManaged public var title: String?
    @NSManaged public var content: String?
    @NSManaged public var imageURL: String?
    @NSManaged public var createDate: Date?
    @NSManaged public var updateDate: Date?

}

extension Daily : Identifiable {

}
