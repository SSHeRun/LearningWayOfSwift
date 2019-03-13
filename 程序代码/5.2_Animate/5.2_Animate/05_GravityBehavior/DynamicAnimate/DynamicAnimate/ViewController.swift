//
//  ViewController.swift
//  DynamicAnimate
//
//  Created by Wei Li on 2016/11/8.
//  Copyright © 2016年 LiWei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let viewSize = 15
    var animator: UIDynamicAnimator!            // iOS物理环境
    var gravity: UIGravityBehavior!             // iOS重力行为
    var collision: UICollisionBehavior!         // iOS碰撞行为
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animator = UIDynamicAnimator(referenceView: self.view)

        gravity = UIGravityBehavior()       // 创建重力行为
        //gravity.angle = 2                 // 下落角度
        gravity.magnitude = 0.5             // 设置重力加速度
        animator.addBehavior(gravity)       // 添加重力行为到物理环境
        
        collision = UICollisionBehavior()   // 创建碰撞行为
        collision.translatesReferenceBoundsIntoBoundary = true          // 将界面边界添加到碰撞场
        animator.addBehavior(collision)     // 添加碰撞行为到物理环境
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureAction(_:)))
        self.view.addGestureRecognizer(tapGesture)
    }

    // 轻击手势识别动作Action方法
    @objc func tapGestureAction(_ sender: UITapGestureRecognizer) {
        
        // 创建视图
        let bgWidth = self.view.frame.size.width
        
        let index = Int(arc4random() % UInt32(bgWidth)) / viewSize
        
        let x = index * viewSize
        
        let view = UIView(frame: CGRect(x: x, y: 0, width: viewSize, height: viewSize))
        view.backgroundColor = randomColor()
        
        // 将视图添加到主视图
        self.view.addSubview(view)
        
        gravity.addItem(view)           // 添加视图到重力场
        collision.addItem(view)         // 添加视图到碰撞场
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

