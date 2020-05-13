//
//  RecipeNavigationTypes.swift
//  Recipes
//
//  Created by Nikhil Gohil on 10/05/2020.
//  Copyright © 2020 gohil. All rights reserved.
//

import UIKit

protocol RecipeViewType: BaseViewType {
    var intent: RecipeIntent! { set get }
}

typealias RecipeViewControllerType = UIViewController & RecipeViewType
