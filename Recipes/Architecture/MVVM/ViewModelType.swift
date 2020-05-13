//
//  ViewModelType.swift
//  Recipes
//
//  Created by Nikhil Gohil on 08/05/2020.
//  Copyright © 2020 gohil. All rights reserved.
//

import Foundation

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}
