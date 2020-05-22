//
//  menuRecipesListType.swift
//  CompleteMenu
//
//  Created by gohil on 18/05/2020.
//  Copyright © 2020 gohil. All rights reserved.
//

import UIKit
import RxDataSources

//protocol MenuRecipesListViewType {
////    var intent: MovieIntent! { set get }
//}

typealias MenuRecipeItem = MenuRecipesListCellViewModel

typealias MenuRecipeSection = AnimatableSectionModel<String, MenuRecipeItem>

protocol MenuRecipesListViewType {
    func routeToMenuRecipesDetail(intent: MenuRecipesIntent)
    func routeToCreateMenuRecipes()
}

typealias MenuRecipesListType = UIViewController & MenuRecipesListViewType

struct MenuRecipesIntent {
    var model: MenuRecipesListCellViewModel
}
