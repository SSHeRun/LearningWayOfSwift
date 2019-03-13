//
//  ViewController.swift
//  Progress
//
//  Created by 李巍 on 2018/10/22.
//  Copyright © 2018年 李巍. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progress: UIProgressView!        // 进度条outlet
    
    // 滑块控件动作目标方法
    @IBAction func sliderAction(_ sender: UISlider) {
        // 获取滑块当前值并设置为进度条进度值
        progress.setProgress(sender.value, animated: true)
    }
    
    // 进步控件动作目标方法
    @IBAction func stepperAction(_ sender: UIStepper) {
        // 获取进步控件当前值并设置为进度条进度值
        progress.setProgress(Float(sender.value), animated: true)
    }
}

