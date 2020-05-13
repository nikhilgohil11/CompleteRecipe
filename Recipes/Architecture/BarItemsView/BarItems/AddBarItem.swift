//
//  AddBarItem.swift
//  Recipes
//
//  Created by Nikhil Gohil on 08/05/2020.
//  Copyright © 2020 gohil. All rights reserved.
//

import UIKit

extension BarItem {
    static func add(closure: ((UIViewController)->())? = AddBarItem.defaultClosure) -> BarItem {
        let ret = AddBarItem()
        ret.closure = closure
        return ret
    }
}

class AddBarItem: BarItem {
    static let defaultId = "Add"
    class func defaultClosure(_ vc:UIViewController) {
        
    }
    init() {
        super.init(id: AddBarItem.defaultId)
    }
    
    override func createBarButtonItem() -> UIBarButtonItem? {
        let item = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(self.performAction(sender:)))
        return item
    }
}
