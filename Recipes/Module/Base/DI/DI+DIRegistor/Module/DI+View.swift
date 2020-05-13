//
//  DI+Dashboard+View.swift
//  MVVM2019June20
//
//  Created by Yee Chuan Lee on 19/07/2019.
//  Copyright © 2019 Yee Chuan Lee. All rights reserved.
//

import Foundation
import SwifterSwift
import Swinject

extension DI {
    struct View: DIRegistor {
        static func register() {
            Recipes.register()
        }
        
        struct Recipes : DIRegistor {
            static func register() {
                let storyboard = UIStoryboard(name: "Recipes", bundle: nil)
                DI.container.register(RecipeViewControllerType.self) { r -> RecipeViewControllerType in
                    return storyboard.instantiateViewController(withIdentifier: "RecipeViewController")
                }
                DI.container.register(RecipeListViewControllerType.self) { r -> RecipeListViewControllerType in
                    var listview = storyboard.instantiateViewController(withIdentifier: "RecipeListViewController") as! RecipeListViewController
//                    listview?.managedObjectContext = CoreDataStack().managedObjectContext
                    return listview
                }
            }
        }
    }
}

