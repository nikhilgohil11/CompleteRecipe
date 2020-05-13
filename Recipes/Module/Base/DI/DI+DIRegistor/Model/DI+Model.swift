//
//  DIModelRegistor.swift
//  MVVM2019June20
//
//  Created by Yee Chuan Lee on 22/07/2019.
//  Copyright © 2019 Yee Chuan Lee. All rights reserved.
//

import Foundation

extension DI {
    struct Model : DIRegistor {
        static func register() {
            Persistency.register()
        }
    }
    
    struct Persistency : DIRegistor {
        static func register() {
            //MARK: Persistency
//            DI.container.register(UserDefaults.self) { r -> UserDefaults in
//                return SwiftyUserDefaults.Defaults
//            }.inObjectScope(.container)
        }
    }
   
}
