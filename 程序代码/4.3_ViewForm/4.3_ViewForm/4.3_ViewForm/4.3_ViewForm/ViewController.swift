//
//  ViewController.swift
//  4.3_ViewForm
//
//  Created by 李巍 on 2018/10/15.
//  Copyright © 2018年 李巍. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // backgroundcolor属性：设置视图背景颜色
        // alpha属性：设置视图透明度
        // hidden属性：设置视图隐藏状态

        self.view.backgroundColor = UIColor.red
        self.view.alpha = 0.7
        self.view.isHidden = true
    }
}

