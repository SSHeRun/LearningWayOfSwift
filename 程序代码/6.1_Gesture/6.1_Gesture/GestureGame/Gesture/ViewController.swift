//
//  ViewController.swift
//  Gesture
//
//  Created by 李巍 on 2018/11/15.
//  Copyright © 2018 李巍. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var imageViewHero: UIImageView!
    var screenWidth = 0
    var screenHeight = 0
    
    let HeroSizeSmall = 50
    let HeroSizeBig = 100
    let EnemySize = 100
    
    var pointTranslate: CGPoint!
    
    var animator: UIDynamicAnimator!            // iOS物理环境
    var gravity: UIGravityBehavior!             // iOS重力行为
    var collision: UICollisionBehavior!         // iOS碰撞行为

    override func viewDidLoad() {
        super.viewDidLoad()
        
        animator = UIDynamicAnimator(referenceView: self.view)
        
        gravity = UIGravityBehavior()       // 创建重力行为
        //gravity.angle = 2                 // 下落角度
        gravity.magnitude = 0.4             // 设置重力加速度
        animator.addBehavior(gravity)       // 添加重力行为到物理环境
        
        collision = UICollisionBehavior()   // 创建碰撞行为
        //collision.translatesReferenceBoundsIntoBoundary = true          // 将界面边界添加到碰撞场
        animator.addBehavior(collision)     // 添加碰撞行为到物理环境
        
        screenWidth = Int(self.view.bounds.width)
        screenHeight = Int(self.view.bounds.height)
        
        imageViewHero = UIImageView(frame: CGRect(x: (screenWidth - HeroSizeSmall) / 2, y: screenHeight - 100 - HeroSizeSmall, width: HeroSizeSmall, height: HeroSizeSmall))
        imageViewHero.image = UIImage(named: "hero\(Int(arc4random() % 3))")
        imageViewHero.isUserInteractionEnabled = true
        self.view.addSubview(imageViewHero)
        
        //gravity.addItem(imageViewHero)
        //collision.addItem(imageViewHero)
        
        pointTranslate = imageViewHero.center
        
        // 创建拖拽手势
        let panGesture = UIPanGestureRecognizer()
        panGesture.addTarget(self, action: #selector(panGestureAction(sender:)))
        imageViewHero.addGestureRecognizer(panGesture)
        
        // 创建双击手势
        let doubleTapGesture = UITapGestureRecognizer()
        doubleTapGesture.numberOfTapsRequired = 2
        doubleTapGesture.numberOfTouchesRequired = 1
        doubleTapGesture.addTarget(self, action: #selector(doubleTapGestureAction))
        imageViewHero.addGestureRecognizer(doubleTapGesture)
        
        // 长按手势识别
        let longpressGesture = UILongPressGestureRecognizer()
        longpressGesture.addTarget(self, action: #selector(longpressGestureAction(sender:)))
        imageViewHero.addGestureRecognizer(longpressGesture)
        
        // 创建单击手势
        let singleTapGesture = UITapGestureRecognizer()
        singleTapGesture.addTarget(self, action: #selector(singleTapGestureAction))
        imageViewHero.addGestureRecognizer(singleTapGesture)
        
        
    }
    
    // 拖拽手势目标方法
    @objc func panGestureAction(sender: UIPanGestureRecognizer) {
        let translate: CGPoint = sender.translation(in: imageViewHero)    // 获取拖动手势坐标
        
        imageViewHero.center.x = translate.x + pointTranslate.x
        imageViewHero.center.y = translate.y + pointTranslate.y
        
        if sender.state == UIGestureRecognizer.State.ended {
            pointTranslate = imageViewHero.center
        }
    }
    
    // 双击手势目标方法
    @objc func doubleTapGestureAction() {
        if Int(imageViewHero.bounds.size.width) == HeroSizeSmall {
            imageViewHero.frame.size.width = CGFloat(HeroSizeBig)
            imageViewHero.bounds.size.height = CGFloat(HeroSizeBig)
            imageViewHero.center = pointTranslate
        } else {
            imageViewHero.frame.size.width = CGFloat(HeroSizeSmall)
            imageViewHero.bounds.size.height = CGFloat(HeroSizeSmall)
            imageViewHero.center = pointTranslate
        }
    }
    
    // 长按手势目标动作方法
    @objc func longpressGestureAction(sender: UILongPressGestureRecognizer) {
        if sender.state == UIGestureRecognizer.State.ended {
            imageViewHero.image = UIImage(named: "hero\(Int(arc4random() % 3))")
        }
    }
    
    // 单击手势目标方法
    @objc func singleTapGestureAction() {
        for _ in 0..<4 {
            let x = Int(arc4random()) % (screenWidth - EnemySize)
            let y = Int(arc4random()) % 600
            let imageViewEnemy = UIImageView(frame: CGRect(x: x, y: -y, width: EnemySize, height: EnemySize))
            imageViewEnemy.image = UIImage(named: "enemy\(Int(arc4random() % 4))")
            self.view.addSubview(imageViewEnemy)
            
            gravity.addItem(imageViewEnemy)
            collision.addItem(imageViewEnemy)
        }
    }
}

