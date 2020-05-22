//
//  MenuRecipesDetailtype.swift
//  CompleteMenu
//
//  Created by gohil on 18/05/2020.
//  Copyright © 2020 gohil. All rights reserved.
//

import UIKit

protocol MenuRecipesDetailViewType {
    func saveRecipe()
    var intent: MenuRecipesIntent! { set get }
}

typealias MenuRecipesDetailType = UIViewController & MenuRecipesDetailViewType


