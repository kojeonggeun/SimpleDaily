//
//  User+CoreDataProperties.swift
//  SimpleDaily
//
//  Created by 고정근 on 2022/06/22.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var name: String?
    @NSManaged public var password: String?
    @NSManaged public var lastUpdated: Date?
    @NSManaged public var oauthCode: String?

}

extension User : Identifiable {

}
