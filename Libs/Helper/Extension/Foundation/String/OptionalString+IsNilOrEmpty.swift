//
//  OptionalString+IsNilOrEmpty.swift
//  TestSMS
//
//  Created by Yee Chuan Lee on 01/04/2019.
//  Copyright © 2019 Yee Chuan Lee. All rights reserved.
//

import Foundation

extension Optional where Wrapped == String {
    var isNilOrEmpty : Bool {
        switch self {
        case .some(let value):
            return value.isNilOrEmpty
        case _:
            return true
        }
    }
}
