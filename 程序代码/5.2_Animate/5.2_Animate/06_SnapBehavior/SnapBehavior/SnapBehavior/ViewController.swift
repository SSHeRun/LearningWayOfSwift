//
//  ViewController.swift
//  SnapBehavior
//
//  Created by Wei Li on 2016/11/8.
//  Copyright © 2016年 LiWei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var animator: UIDynamicAnimator!            // iOS物理环境
    var collision: UICollisionBehavior!         // iOS碰撞行为
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animator = UIDynamicAnimator(referenceView: self.view)

        collision = UICollisionBehavior()       // 创建碰撞行为
        animator.addBehavior(collision)         // 将碰撞行为添加到物理环境
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureAction(_:)))
        self.view.addGestureRecognizer(tapGesture)
    }

    // 轻击手势识别动作Action方法
    @objc func tapGestureAction(_ sender: UITapGestureRecognizer) {
        // 创建自定义View
        let view = UIView()
        view.frame.origin.x = CGFloat(arc4random() % UInt32(self.view.frame.size.width))
        view.frame.origin.y = CGFloat(arc4random() % UInt32(self.view.frame.size.height))
        view.frame.size = CGSize(width: 15, height: 15)
        view.backgroundColor = randomColor()
        
        self.view.addSubview(view)
        
        collision.addItem(view)                     // 将自定义View添加到碰撞场
        
        let snap = UISnapBehavior(item: view, snapTo: sender.location(in: self.view))       // 创建吸附行为
        animator.addBehavior(snap)                  // 将自定义View添加到吸附场
    }
    
    func randomColor() -> UIColor {
        switch (arc4random() % 8) {
        case 0: return UIColor.blue
        case 1: return UIColor.brown
        case 2: return UIColor.cyan
        case 3: return UIColor.green
        case 4: return UIColor.orange
        case 5: return UIColor.purple
        case 6: return UIColor.red
        case 7: return UIColor.yellow
        default: return UIColor.black
        }
    }
}

