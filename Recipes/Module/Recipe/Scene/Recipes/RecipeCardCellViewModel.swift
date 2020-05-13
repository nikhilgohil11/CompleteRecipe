//
//  RecipeNavigationTypes.swift
//  Recipes
//
//  Created by Nikhil Gohil on 10/05/2020.
//  Copyright © 2020 gohil. All rights reserved.
//

import Foundation

struct RecipeCardCellViewModel {
    //Presentation - Poster
    var posterImageURL: URL?
    //Presentation - Content - Header
    var headerTitleText: String?
    var headerSubTitleText: String?
    var headerTypeText: String?
    //State
    var RecipeSearchResult: Recipe? //..
    //Initializer
    init() { }
}
