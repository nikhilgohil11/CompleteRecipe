//
//  Recipe+Ext.swift
//  Recipes
//
//  Created by Nikhil Gohil on 13/05/2020.
//  Copyright © 2020 gohil. All rights reserved.
//

import Foundation
import CoreData
import Domain
import QueryKit
import RxSwift

extension CDRecipe {
    static var date: Attribute<Date> { return Attribute("date")}
    static var uid: Attribute<String> { return Attribute("uid")}
    static var image: Attribute<String> { return Attribute("image")}
    static var subtitle: Attribute<String> { return Attribute("subtitle")}
    static var title: Attribute<String> { return Attribute("title")}
    static var type: Attribute<String> { return Attribute("type")}
}

extension CDRecipe: DomainConvertibleType {
    func asDomain() -> Recipe {
        return Recipe(date: date!,
                    uid: uid!,
                    image: image!,
                    subtitle: subtitle!,
                    title: title!,
                    type: type!)
    }
}

extension CDRecipe: Persistable {
    static var entityName: String {
        return "CDRecipe"
    }
}

extension Recipe: CoreDataRepresentable {
    typealias CoreDataType = CDRecipe
    
    func update(entity: CDRecipe) {
        entity.date = date
        entity.uid = uid
        entity.image = image
        entity.subtitle = subtitle
        entity.title = title
        entity.type = type
    }
}
