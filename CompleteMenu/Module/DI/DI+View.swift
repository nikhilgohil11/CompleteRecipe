//
//  DI+View.swift
//  CompleteMenu
//
//  Created by gohil on 17/05/2020.
//  Copyright © 2020 gohil. All rights reserved.
//

import Foundation
import Swinject

extension DI{
    struct View : DIRegister {
        static func register() {
            MenuRecipes.register()
        }
    }
    
    struct MenuRecipes : DIRegister {
        static func register() {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            DI.container.register(MenuRecipesDetailType.self) { r -> MenuRecipesDetailType in
                return storyboard.instantiateViewController(withIdentifier: "MenuRecipesDetailController")
           }
            DI.container.register(MenuRecipesListType.self) { r -> MenuRecipesListType in
                return storyboard.instantiateViewController(withIdentifier: "MenuRecipesListController")
            }
        }
    }
    
}
