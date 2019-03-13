//
//  ViewController.swift
//  Segment
//
//  Created by 李巍 on 2018/10/22.
//  Copyright © 2018年 李巍. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red     // 设置默认背景颜色为红色
    }
    
    @IBAction func segmentClick(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {        // selectedSegmentIndex属性
        case 0:
            self.view.backgroundColor = UIColor.red
        case 1:
            self.view.backgroundColor = UIColor.green
        case 2:
            self.view.backgroundColor = UIColor.yellow
        default:
            self.view.backgroundColor = UIColor.black
        }
    }
}

