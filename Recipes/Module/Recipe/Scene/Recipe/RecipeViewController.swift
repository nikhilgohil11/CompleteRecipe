//
//  RecipeViewController.swift
//  MVVM2019June20
//
//  Created by Yee Chuan Lee on 01/07/2019.
//  Copyright © 2019 Yee Chuan Lee. All rights reserved.
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
