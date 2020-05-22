//
//  DI.swift
//  CompleteMenu
//
//  Created by gohil on 17/05/2020.
//  Copyright © 2020 gohil. All rights reserved.
//

import Foundation
import Swinject
import UIKit

struct DI {
    static let container = Container()
    static let resolver : Resolver = { return container.synchronize() }()
}

extension UIStoryboard {
    func instantiateViewController<T>(withIdentifier identifier: String) -> T {
        return self.instantiateViewController(withIdentifier: identifier) as! T
    }
}

protocol DIRegister {
    static func register()
}

extension DI : DIRegister{
    static func register() {
        //Model
        //View
        View.register()
        ViewModel.register()
        //ViewModel
    }
}

@propertyWrapper
struct Injected<Service> {
    private var service: Service?
    init() { }
    public var wrappedValue: Service {
        mutating get {
            if service == nil {
                service = DI.resolver.resolve(Service.self)
            }
            return service!
        }
        mutating set {
            service = newValue
        }
    }
}
