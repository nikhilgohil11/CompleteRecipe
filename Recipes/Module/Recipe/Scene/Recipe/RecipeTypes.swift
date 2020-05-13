//
//  RecipeTypes.swift
//  MVVM2019June20
//
//  Created by Yee Chuan Lee on 25/07/2019.
//  Copyright © 2019 Yee Chuan Lee. All rights reserved.
//

import UIKit

protocol RecipeViewType: BaseViewType {
    var intent: RecipeIntent! { set get }
}

typealias RecipeViewControllerType = UIViewController & RecipeViewType
