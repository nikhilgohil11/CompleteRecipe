//
//  MenuRecipesListCellViewModel.swift
//  CompleteMenu
//
//  Created by gohil on 19/05/2020.
//  Copyright © 2020 gohil. All rights reserved.
//

import Foundation
import CoreData
import RxDataSources
import RxCoreData

struct MenuRecipesListCellViewModel {

    var menuRecipesImageURL: String?
    var title: String?
    var details: String?
    var type: String?
    var date: String?

    //State
//    var menuRecipe: MenuRecipe?
    //Initializer
//    init() { }
}

extension MenuRecipesListCellViewModel : IdentifiableType {
    typealias Identity = String
    
    var identity: Identity { return date ?? "" }
}

func == (lhs: MenuRecipesListCellViewModel, rhs: MenuRecipesListCellViewModel) -> Bool {
    return lhs.date == rhs.date
}

extension MenuRecipesListCellViewModel : Equatable { }

extension MenuRecipesListCellViewModel : Persistable {
    typealias T = NSManagedObject
    
    static var entityName: String {
        return "MenuRecipesListCellViewModel"
    }
    
    static var primaryAttributeName: String {
        return "date"
    }
    
    init(entity: T) {
        menuRecipesImageURL = entity.value(forKey: "menuRecipesImageURL") as! String
        title = entity.value(forKey: "title") as! String
        details = entity.value(forKey: "details") as! String
        type = entity.value(forKey: "type") as! String
        date = entity.value(forKey: "date") as! String
    }
    
    func update(_ entity: T) {
        entity.setValue(menuRecipesImageURL,forKey: "menuRecipesImageURL")
        entity.setValue(title,forKey: "title")
        entity.setValue(details,forKey: "details")
        entity.setValue(type,forKey: "type")
        entity.setValue(date, forKey: "date")
        
        do {
            try entity.managedObjectContext?.save()
        } catch let e {
            print(e)
        }
    }
    
}

struct MenuRecipe{
    var id :String?
}
