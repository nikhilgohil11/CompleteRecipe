//
//  MenuRecipeNavigationController.swift
//  CompleteMenu
//
//  Created by gohil on 19/05/2020.
//  Copyright © 2020 gohil. All rights reserved.
//

import UIKit

class MenuRecipeNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setViewControllers([createMenuRecipesList()], animated: false)
    }
    
    fileprivate func createMenuRecipesList() -> UIViewController {
        let screen = DI.resolver.resolve(MenuRecipesListType.self)!
        return screen
    }
}
