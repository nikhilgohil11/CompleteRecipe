//
//  RecipeNavigationTypes.swift
//  Recipes
//
//  Created by Nikhil Gohil on 10/05/2020.
//  Copyright © 2020 gohil. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class RecipeViewController: BaseViewController<RecipeViewModel> {
    var intent: RecipeIntent!
    override func loadView() {
        super.loadView()
        viewModel = DI.resolver.resolve(RecipeViewModel.self, argument: intent!)
    }
}
//MARK: <RecipeViewControllerType>
extension RecipeViewController : RecipeViewType {
    
}
