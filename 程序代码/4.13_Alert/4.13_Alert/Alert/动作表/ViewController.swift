//
//  ViewController.swift
//  动作表
//
//  Created by 李巍 on 2017/8/19.
//  Copyright © 2017年 李巍. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!

    @IBAction func btnAction(_ sender: UIButton) {
        // 创建动作表对象
        let alertCtrl = UIAlertController(title: "你要做什么", message: "选择一下，你计划做什么？", preferredStyle: .alert)
        
        // 创建提醒动作
        let actionEat = UIAlertAction(title: "去吃饭", style: .default, handler: nil)
        let actionSleep = UIAlertAction(title: "去睡觉", style: .default, handler: nil)
        let actionClass = UIAlertAction(title: "去上课", style: .default) { (actionClass) in
            self.label.text = "欢迎学习iOS课程"   // 提醒动作点击后的调用
        }
        let actionDoNothing = UIAlertAction(title: "什么都不做", style: .destructive, handler: nil)
        let actionCancel = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        
        // 将提醒动作添加到动作表中
        alertCtrl.addAction(actionEat)
        alertCtrl.addAction(actionSleep)
        alertCtrl.addAction(actionClass)
        alertCtrl.addAction(actionDoNothing)
        alertCtrl.addAction(actionCancel)
        
        // 显示动作表
        present(alertCtrl, animated: true, completion: nil)
    }
}

