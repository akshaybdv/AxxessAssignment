//
//  Entity+CoreDataProperties.swift
//  
//
//  Created by Badve, Akshay on 6/26/20.
//
//

import Foundation
import CoreData


extension Entity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Entity> {
        return NSFetchRequest<Entity>(entityName: "Entity")
    }

    @NSManaged public var data: String?
    @NSManaged public var date: String?
    @NSManaged public var id: String?
    @NSManaged public var type: String?

}
