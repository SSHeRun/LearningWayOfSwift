//
//  ViewController.swift
//  AddLabelAnimate
//
//  Created by Li Wei on 2016/11/7.
//  Copyright © 2016年 LiWei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton(frame: CGRect(x: 0, y: 100, width: self.view.bounds.size.width, height: 30))
        button.setTitle("添加标签动画", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.addTarget(self, action: #selector(btnAction(_:)), for: .touchDown)
        self.view.addSubview(button)
    }

    func randomColor() -> UIColor {
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
    
    // 手势识别动作Action方法
    @objc func btnAction(_ sender: UITapGestureRecognizer) {
        for _ in 0..<100 {
            // 创建标签Label
            let labelText = UILabel()
            labelText.frame.origin.x = CGFloat(arc4random() % UInt32(self.view.frame.size.width))
            labelText.frame.origin.y = CGFloat(arc4random() % UInt32(self.view.frame.size.height))
            labelText.frame.size.width = 150
            labelText.frame.size.height = 30
            
            labelText.text = "Hello Teacher Li."
            labelText.textColor = self.randomColor()
            self.view.addSubview(labelText)
            
            // 计算动画移动终点坐标
            let destX = CGFloat(arc4random() % UInt32(self.view.frame.size.width))
            let destY = CGFloat(arc4random() % UInt32(self.view.frame.size.height))

            // 设置动画
            UIView.animate(withDuration: 3, delay: 0, options: [.repeat, .autoreverse], animations: {
                    labelText.center = CGPoint(x: destX, y: destY)
                    labelText.alpha = 0     // 设置透明
                }, completion: {
                    (Bool) -> () in
                    labelText.alpha = 1     // 设置不透明
                })
        }
    }
}

