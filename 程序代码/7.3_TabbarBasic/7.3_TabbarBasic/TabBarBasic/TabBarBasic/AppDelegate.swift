//
//  AppDelegate.swift
//  TabBarBasic
//
//  Created by LiWei on 2016/12/5.
//  Copyright © 2016年 LiWei. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    
    // 创建并现实窗口
    self.window = UIWindow(frame: UIScreen.main.bounds)
    self.window?.makeKeyAndVisible()
    
    // 创建6个视图控制器
    let vcFirst = VCFirst()
    let vcSecond = VCSecond()
    let vcThird = VCThird()
    let vcFourth = VCFourth()
    let vcFifth = VCFifth()
    let vcSixth = VCSixth()
    
    vcFirst.view.backgroundColor = UIColor.red
    vcSecond.view.backgroundColor = UIColor.blue
    vcThird.view.backgroundColor = UIColor.green
    vcFourth.view.backgroundColor = UIColor.orange
    vcFifth.view.backgroundColor = UIColor.cyan
    vcSixth.view.backgroundColor = UIColor.yellow
    
    // 修改视图控制器标题
    vcFirst.title = "视图1"
    vcSecond.title = "视图2"
    vcThird.title = "视图3"
    
    // 修改分栏控制器的工具条
    //let tabBarItemFirst = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 101)
    
    // 使用自定义图片
    var imgSelected = UIImage(named: "通讯录选中图标")
    imgSelected = imgSelected?.withRenderingMode(.alwaysOriginal)
    var imgUnselected = UIImage(named: "通讯录未选中图标")
    imgUnselected = imgUnselected?.withRenderingMode(.alwaysOriginal)
    let tabBarItemFirst = UITabBarItem(title: "通讯录", image: imgUnselected, selectedImage: imgSelected)
    vcFirst.tabBarItem = tabBarItemFirst
    // 分栏按钮提示消息
    tabBarItemFirst.badgeValue = "12"
    let tabBarItemSecond = UITabBarItem(tabBarSystemItem: .favorites, tag: 201)
    vcSecond.tabBarItem = tabBarItemSecond
    
    let tabBarItemThird = UITabBarItem(tabBarSystemItem: .downloads, tag: 301)
    vcThird.tabBarItem = tabBarItemThird
    
    let tabBarItemFourth = UITabBarItem(tabBarSystemItem: .history, tag: 401)
    vcFourth.tabBarItem = tabBarItemFourth
    
    let tabBarItemFifth = UITabBarItem(tabBarSystemItem: .search, tag: 501)
    vcFifth.tabBarItem = tabBarItemFifth
    
    let tabBarItemSixth = UITabBarItem(tabBarSystemItem: .contacts, tag: 601)
    vcSixth.tabBarItem = tabBarItemSixth
    
    // 创建视图控制器数组
    let arrVC: [UIViewController] = [vcFirst, vcSecond, vcThird, vcFourth, vcFifth, vcSixth]
    
    // 创建分栏控制器
    let tabBar = UITabBarController()
    // 为分栏控制器数组赋值
    tabBar.viewControllers = arrVC
    // 设置分栏工具栏透明
    tabBar.tabBar.isTranslucent = false
    // 默认选中的视图索引
    tabBar.selectedIndex = 1
    
    // 将分栏控制器设置为根控制器
    self.window?.rootViewController = tabBar
    
    return true
  }
}

