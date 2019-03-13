//
//  ViewController.swift
//  4.4_ViewGeometry
//
//  Created by 李巍 on 2018/10/15.
//  Copyright © 2018年 李巍. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // addSubView方法，在视图最上层添加子视图
        // InsertSubView方法，在视图特定层次添加子视图
        // bringSubView方法，移动指定子视图到最前
        // sendSubView方法，移动指定子视图到最后
        // exchangeSubView方法，交换两个子视图的层次位置

        
        // 1. 创建视图并添加视图
        let rect = CGRect(x: 50, y: 50, width: 200, height: 300)    // 创建矩形对象
        
        let subView1 = UIView(frame: rect)          // 创建视图对象
        subView1.backgroundColor = UIColor.red      // 修改视图对象背景颜色
        self.view.addSubview(subView1)              // 将视图添加到主视图
        
        let subView2 = UIView(frame: CGRect(x: 100, y: 100, width: 200, height: 300))
        subView2.backgroundColor = UIColor.orange
        self.view.addSubview(subView2)
        
        let subView4 = UIView(frame: CGRect(x: 200, y: 200, width: 200, height: 300))
        subView4.backgroundColor = UIColor.green
        self.view.addSubview(subView4)
        
        
        // 2. 使用insertView在特定位置添加视图
        let subView3 = UIView(frame: CGRect(x: 150, y: 150, width: 200, height: 300))
        subView3.backgroundColor = UIColor.yellow
        //self.view.addSubview(subView3)            // 层次关系不对
        self.view.insertSubview(subView3, belowSubview: subView4)   // 使用insertView在特定位置添加视图
        
        
        // 3. 将视图放在最上或最下
        self.view.bringSubview(toFront: subView1)   // 移动指定子视图到最前
        self.view.sendSubview(toBack: subView4)     // 移动指定子视图到最后
        
        
        // 4. 交换两个视图层次位置
        self.view.exchangeSubview(at: 1, withSubviewAt: 2)
        
        
        // 5. 删除子视图
        subView4.removeFromSuperview()
    }
}

