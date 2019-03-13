//
//  ViewController.swift
//  Button
//
//  Created by 李巍 on 2018/10/20.
//  Copyright © 2018年 李巍. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // 随机颜色函数
    func randomColor() -> UIColor {
        let n = arc4random() % 8
        
        switch(n) {
        case 0: return UIColor.red
        case 1: return UIColor.orange
        case 2: return UIColor.yellow
        case 3: return UIColor.green
        case 4: return UIColor.cyan
        case 5: return UIColor.blue
        case 6: return UIColor.purple
        case 7: return UIColor.white
        default: return UIColor.black
        }
    }
    
    @IBAction func btnClickAction(_ sender: UIButton) {
        self.view.backgroundColor = randomColor()
    }
    
}

