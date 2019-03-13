//
//  AppDelegate.swift
//  UIByCode
//
//  Created by 李巍 on 2018/10/20.
//  Copyright © 2018年 李巍. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // 创建窗口并显示
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        // 创建并设置根视图控制器
        let myViewController = MyViewController()
        window?.rootViewController = myViewController
        
        return true
    }
}

