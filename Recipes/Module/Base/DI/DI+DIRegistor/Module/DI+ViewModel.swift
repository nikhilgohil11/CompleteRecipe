//
//  DI+Dashboard+ViewModel.swift
//  MVVM2019June20
//
//  Created by Yee Chuan Lee on 19/07/2019.
//  Copyright © 2019 Yee Chuan Lee. All rights reserved.
//

import Foundation

extension DI {
    struct ViewModel: DIRegistor {
        static func register() {
            RecipeVM.register()
        }
       
        struct RecipeVM : DIRegistor {
            static func register() {
                DI.container.register(RecipeListViewModel.self) { r in
                    return RecipeListViewModel()
                }
                DI.container.register(RecipeViewModel.self) { (r, intent: RecipeIntent) in
                    return RecipeViewModel(intent: intent)
                }
            }
        }
        
    }
}

