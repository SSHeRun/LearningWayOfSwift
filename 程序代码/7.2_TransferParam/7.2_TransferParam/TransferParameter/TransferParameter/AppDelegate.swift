//
//  AppDelegate.swift
//  TransferParameter
//
//  Created by 李巍 on 2017/11/26.
//  Copyright © 2017年 李巍. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.makeKeyAndVisible()
    
    let vc1 = VCFirst()
    
    let nav = UINavigationController(rootViewController: vc1)
    
    window?.rootViewController = nav
    
    return true
  }
}

