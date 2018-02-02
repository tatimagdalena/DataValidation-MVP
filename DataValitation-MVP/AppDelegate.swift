//
//  AppDelegate.swift
//  DataValitation-MVP
//
//  Created by Tatiana Magdalena on 01/02/18.
//  Copyright © 2018 Tatiana Magdalena. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: RegistrationViewController())
        window?.makeKeyAndVisible()
        
        return true
    }

}

