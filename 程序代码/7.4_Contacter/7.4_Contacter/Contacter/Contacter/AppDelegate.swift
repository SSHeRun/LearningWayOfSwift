//
//  AppDelegate.swift
//  Contacter
//
//  Created by 李巍 on 2018/11/29.
//  Copyright © 2018年 LW. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // 1. 创建所需的主主视图控制器
        let vcFavorites = VCFavorites()     // 个人收藏视图控制器
        let vcRecent = VCRecent()           // 最近通话视图控制器
        let vcContacter = VCContacter()     // 通讯录视图控制器
        
        vcFavorites.title = "个人收藏"
        vcFavorites.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        vcRecent.title = "最近通话"
        vcRecent.tabBarItem = UITabBarItem(tabBarSystemItem: .recents, tag: 1)
        vcContacter.title = "联系人"
        vcContacter.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 2)
        
        // 2. 创建所需的导航控制器
        let navFavorites = UINavigationController(rootViewController: vcFavorites)
        let navRecent = UINavigationController(rootViewController: vcRecent)
        let navContacter = UINavigationController(rootViewController: vcContacter)
        
        // 3. 创建分栏控制器
        let arrNav = [navFavorites, navRecent, navContacter]        // 创建分栏控制器管理的控制器数组
        let tabbar = UITabBarController()
        tabbar.viewControllers = arrNav                             // 指定分栏控制器管理的视图控制器
        
        // 3. 创建并显示窗口
        window = UIWindow(frame: UIScreen.main.bounds)              // 创建窗口
        window?.rootViewController = tabbar                         // 指定窗口的根控制器
        window?.makeKeyAndVisible()
        
        return true
    }
}

