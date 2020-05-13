//
//  CDRecipe+CoreDataProperties.swift
//  
//
//  Created by Nikhil Gohil on 13/05/2020.
//
//

import Foundation
import CoreData


extension CDRecipe {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDRecipe> {
        return NSFetchRequest<CDRecipe>(entityName: "CDRecipe")
    }

    @NSManaged public var date: Date?
    @NSManaged public var image: String?
    @NSManaged public var subtitle: String?
    @NSManaged public var title: String?
    @NSManaged public var type: String?
    @NSManaged public var uid: String?

}
