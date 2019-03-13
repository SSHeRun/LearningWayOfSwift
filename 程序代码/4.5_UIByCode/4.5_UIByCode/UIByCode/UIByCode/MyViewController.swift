//
//  MyViewController.swift
//  UIByCode
//
//  Created by 李巍 on 2018/10/20.
//  Copyright © 2018年 李巍. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {

    func randomColor() -> UIColor {     // 随机颜色
        switch arc4random() % 7 {
        case 0: return UIColor.red
        case 1: return UIColor.orange
        case 2: return UIColor.yellow
        case 3: return UIColor.green
        case 4: return UIColor.cyan
        case 5: return UIColor.blue
        case 6: return UIColor.purple
        default: return UIColor.black
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white   // 设置主视图背景颜色为白色
        
        // 获取屏幕尺寸
        let screenWidth = Int(UIScreen.main.bounds.size.width)// - 130
        let screenHeight = Int(UIScreen.main.bounds.size.height)
        
        for _ in 0..<100 {
            // 随机生成子视图坐标
            let x = Int(arc4random()) % screenWidth
            let y = Int(arc4random()) % screenHeight
            let frame = CGRect(x: x, y: y, width: 130, height: 30)
            
            // 创建Label对象
            let label = UILabel(frame: frame)
            label.text = "Hello Teacher Li"
            label.textColor = randomColor()     // 修改标签文字颜色
            
            // 添加子视图
            self.view.addSubview(label)
        }
    }
}
