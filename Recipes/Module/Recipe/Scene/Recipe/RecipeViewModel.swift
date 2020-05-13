//
//  RecipeNavigationTypes.swift
//  Recipes
//
//  Created by Nikhil Gohil on 10/05/2020.
//  Copyright © 2020 gohil. All rights reserved.
//


import RxSwift
import RxCocoa

class RecipeViewModel: BaseViewModel {
    var intent: RecipeIntent
    
    init(intent: RecipeIntent) {
        self.intent = intent
        super.init()
    }
}
