//
//  ViewController.swift
//  Gesture
//
//  Created by 李巍 on 2017/11/9.
//  Copyright © 2017年 李巍. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var rectView: UIView!
    var pointTranslate: CGPoint = CGPoint(x: 160, y: 200)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rectView = UIView(frame: CGRect(x: 160, y: 200, width: 100, height: 100))
        rectView.backgroundColor = randomColor()
        rectView.isUserInteractionEnabled = true
        self.view.addSubview(rectView)
        
        // 创建单击手势
        let singleTapGesture = UITapGestureRecognizer()
        singleTapGesture.addTarget(self, action: #selector(singleTapGestureAction))
        rectView.addGestureRecognizer(singleTapGesture)
        
        // 创建双击手势
        let doubleTapGesture = UITapGestureRecognizer()
        doubleTapGesture.numberOfTapsRequired = 2
        doubleTapGesture.numberOfTouchesRequired = 1
        doubleTapGesture.addTarget(self, action: #selector(doubleTapGestureAction))
        rectView.addGestureRecognizer(doubleTapGesture)
        
        // 创建拖拽手势
        let panGesture = UIPanGestureRecognizer()
        panGesture.addTarget(self, action: #selector(panGestureAction(sender:)))
        rectView.addGestureRecognizer(panGesture)
        
        // 长按手势识别
        let longpressGesture = UILongPressGestureRecognizer()
        longpressGesture.addTarget(self, action: #selector(longpressGestureAction(sender:)))
        rectView.addGestureRecognizer(longpressGesture)
    }
    
    // 单击手势目标方法
    @objc func singleTapGestureAction() {
        rectView.backgroundColor = randomColor()
    }
    
    // 双击手势目标方法
    @objc func doubleTapGestureAction() {
        if rectView.bounds.size.width == 100 {
            rectView.frame = CGRect(x: 110, y: 150, width: 200, height: 200)
        } else {
            rectView.frame = CGRect(x: 160, y: 200, width: 100, height: 100)
        }
    }
    
    // 拖拽手势目标方法
    @objc func panGestureAction(sender: UIPanGestureRecognizer) {
        let translate: CGPoint = sender.translation(in: rectView)    // 获取拖动手势坐标
        
        rectView.frame.origin.x = translate.x + pointTranslate.x
        rectView.frame.origin.y = translate.y + pointTranslate.y
        
        if sender.state == UIGestureRecognizerState.ended {
            pointTranslate = rectView.frame.origin
        }
    }
    
    @objc func longpressGestureAction(sender: UILongPressGestureRecognizer) {
        if sender.state == UIGestureRecognizerState.ended {
            let viewAdd = UIView()
            viewAdd.frame.origin.x = CGFloat(arc4random() % UInt32(self.view.frame.size.width))
            viewAdd.frame.origin.y = CGFloat(arc4random() % UInt32(self.view.frame.size.height))
            viewAdd.frame.size = CGSize(width: 100, height: 100)
            
            viewAdd.backgroundColor = randomColor()
            
            self.view.addSubview(viewAdd)
        }
    }
    
    func randomColor() -> UIColor {
        switch (arc4random() % 8) {
        case 0: return UIColor.red
        case 1: return UIColor.blue
        case 2: return UIColor.brown
        case 3: return UIColor.cyan
        case 4: return UIColor.green
        case 5: return UIColor.orange
        case 6: return UIColor.purple
        case 7: return UIColor.yellow
        default: return UIColor.white
        }
    }
}

