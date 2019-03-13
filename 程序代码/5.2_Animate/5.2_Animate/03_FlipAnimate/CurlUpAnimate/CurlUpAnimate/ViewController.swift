//
//  ViewController.swift
//  CurlUpAnimate
//
//  Created by Wei Li on 2016/11/8.
//  Copyright © 2016年 LiWei. All rights reserved.
//  知识点： 使用beginAnimate和commitAnimate
//          管理子视图
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 创建手势识别
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureAction(_:)))
        self.view.addGestureRecognizer(tapGesture)
        
        // 创建两个Label
        let labelQuestion = UILabel(frame: self.view.bounds)
        labelQuestion.backgroundColor = UIColor.red
        labelQuestion.text = "问：啥都不会怎么办？"
        labelQuestion.textColor = UIColor.white
        labelQuestion.textAlignment = .center
        
        let labelAnswer = UILabel(frame: self.view.bounds)
        labelAnswer.backgroundColor = UIColor.green
        labelAnswer.font = UIFont.systemFont(ofSize: 30)
        labelAnswer.text = "多半是废了"
        labelAnswer.textAlignment = .center
        
        self.view.insertSubview(labelAnswer, at: 0)
        self.view.insertSubview(labelQuestion, at: 1)
    }
    
    @objc func tapGestureAction(_ sender: UITapGestureRecognizer) {
        // 设置动画
        UIView.beginAnimations(nil, context: nil)       // 开始动画
        UIView.setAnimationDuration(1.0)                // 设置动画持续时间
        UIView.setAnimationTransition(.flipFromLeft, for: self.view, cache: true)     // 设置动画切换方法
        self.view.exchangeSubview(at: 1, withSubviewAt: 0)                      // 交换子视图
        UIView.commitAnimations()                       // 结束动画
    }
    
}

