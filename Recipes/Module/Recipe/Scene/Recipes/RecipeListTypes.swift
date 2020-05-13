//
//  RecipeListTypes.swift
//  MVVM2019June20
//
//  Created by Yee Chuan Lee on 25/07/2019.
//  Copyright © 2019 Yee Chuan Lee. All rights reserved.
//

import UIKit
import RxDataSources

typealias RecipeItem = RecipeCardCellViewModel

typealias RecipeSection = SectionModel<String, RecipeItem>

protocol RecipeListViewType: BasePaginationViewType {
    func routeToRecipeDetail(intent: RecipeIntent)
}


typealias RecipeListViewControllerType = UIViewController & RecipeListViewType
