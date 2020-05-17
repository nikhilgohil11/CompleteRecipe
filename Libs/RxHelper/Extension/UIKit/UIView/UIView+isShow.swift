//
//  UIView+isShow.swift
//  Recipes
//
//  Created by gohil on 17/05/2020.
//  Copyright © 2020 gohil. All rights reserved.
//

import UIKit

extension UIView {
    var isShow: Bool {
        set {isHidden = !newValue}
        get {return !isHidden}
    }
}
