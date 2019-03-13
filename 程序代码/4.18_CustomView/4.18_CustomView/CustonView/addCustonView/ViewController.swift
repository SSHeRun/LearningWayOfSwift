//
//  ViewController.swift
//  addCustonView
//
//  Created by Li Wei on 2016/10/31.
//  Copyright © 2016年 LiWei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // 按钮动作Action方法
    @IBAction func btnAddViewAction(_ sender: UIButton) {
        let x = Int(arc4random() % UInt32(self.view.frame.size.width))
        let y = Int(arc4random() % UInt32(self.view.frame.size.height))
        
        // 创建自定义视图
        let customView = CustomView(frame: CGRect(x: x, y: y, width: 100, height: 100))
        
        // 将自定义视图添加到主视图
        self.view.addSubview(customView)
    }

}

