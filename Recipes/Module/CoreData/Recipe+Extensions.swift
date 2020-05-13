//
//  Recipe+Extensions.swift
//  Recipes
//
//  Created by Nikhil Gohil on 11/05/2020.
//  Copyright © 2020 gohil. All rights reserved.
//

import Foundation
import CoreData
import RxDataSources
import RxCoreData

func == (lhs: Recipe, rhs: Recipe) -> Bool {
    return lhs.id == rhs.id
}

extension Recipe : Equatable { }

extension Recipe : IdentifiableType {
    typealias Identity = String
    
    var identity: Identity { return id }
}

extension Recipe : Persistable {
    typealias T = NSManagedObject
    
    static var entityName: String {
        return "Recipe"
    }
    
    static var primaryAttributeName: String {
        return "id"
    }
    
    init(entity: T) {
        id = entity.value(forKey: "id") as! String
        image = entity.value(forKey: "image") as! String
        title = entity.value(forKey: "title") as! String
        subtitle = entity.value(forKey: "subtitle") as! String
        type = entity.value(forKey: "type") as! String
        date = entity.value(forKey: "date") as! Date
    }
    
    func update(_ entity: T) {
        entity.setValue(id, forKey: "id")
        entity.setValue(type, forKey: "type")
        entity.setValue(subtitle, forKey: "subtitle")
        entity.setValue(title, forKey: "title")
        entity.setValue(image, forKey: "image")
        entity.setValue(date, forKey: "date")
        
        do {
            try entity.managedObjectContext?.save()
        } catch let e {
            print(e)
        }
    }
    
}
