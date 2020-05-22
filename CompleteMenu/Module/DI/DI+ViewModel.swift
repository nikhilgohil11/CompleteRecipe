//
//  DI+ViewModel.swift
//  CompleteMenu
//
//  Created by gohil on 17/05/2020.
//  Copyright © 2020 gohil. All rights reserved.
//

import Foundation

extension DI {
    struct ViewModel: DIRegister {
        static func register() {
            MenuRecipes.register()
        }
        
        struct MenuRecipes : DIRegister {
            static func register() {
                DI.container.register(MenuRecipesListViewModel.self) { (r, vc: MenuRecipesListController)  in
                    return MenuRecipesListViewModel(vc: vc)
                }
                DI.container.register(MenuRecipesDetailViewModel.self) { (r,vc: MenuRecipesDetailController) in
                    return MenuRecipesDetailViewModel(vc: vc)
                }
            }
        }
    }
}

