//
//  AppDelegate.swift
//  4.2_AppLifecycle
//
//  Created by 李巍 on 2018/10/15.
//  Copyright © 2018年 李巍. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        // 在程序启动后需要执行的代码写在此处
        print("----> 应用程序加载启动成功")
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
        // 当应用程序将要入非活动状态执行，在此期间，应用程序不接收消息或事件，比如来电话了
        print("----> 程序由活动状态进入非活动状态")
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        // 当程序被推送到后台的时候调用。所以要设置后台继续运行的动作，则在这个函数里面设置即可。
        // 应该保存好数据，后台程序随时可能被终结
        print("----> 程序进入后台运行")
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
        // 当程序从后台将要重新回到前台时候调用
        print("----> 程序进入前台运行")
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        // 当程序从后台将要重新回到活动状态时候调用，比如电话通话结束了
        print("----> 程序由非活动状态进入活动状态")
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // 当程序将要退出时被调用，通常是用来保存数据和一些退出前的清理工作。
        print("----> 程序即将退出")
    }
}

