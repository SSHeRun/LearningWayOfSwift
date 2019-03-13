//
//  AppDelegate.swift
//  NavigationBasic
//
//  Created by 李巍 on 2017/11/21.
//  Copyright © 2017年 李巍. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.makeKeyAndVisible()
    
    let vcFirst = VCFirst()
    
    let navigation = UINavigationController(rootViewController: vcFirst)
    
    window?.rootViewController = navigation

    
    return true
  }
}

