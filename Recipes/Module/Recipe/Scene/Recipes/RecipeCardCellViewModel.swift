//
//  RecipeCardCellViewModel.swift
//  MVVM2019June20
//
//  Created by Yee Chuan Lee on 02/07/2019.
//  Copyright © 2019 Yee Chuan Lee. All rights reserved.
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
    var recipe: Recipe? //..
    //Initializer
    init (with recipe:Recipe) {
        self.recipe = recipe
        self.headerTitleText = recipe.title.uppercased
        self.headerSubTitleText = recipe.subtitle
        self.headerTypeText = recipe.type
    }}
