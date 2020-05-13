//
//  AppDelegate.swift
//  Recipes
//
//  Created by Nikhil Gohil on 05/05/2020.
//  Copyright © 2020 gohil. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
         let window = UIWindow(frame: UIScreen.main.bounds)
         
         Application.shared.configureMainInterface(in: window)
         
         self.window = window
         return true
     }

}

