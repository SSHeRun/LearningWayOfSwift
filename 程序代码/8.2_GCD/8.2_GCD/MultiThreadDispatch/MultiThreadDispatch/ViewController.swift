//
//  ViewController.swift
//  MultiThreadDispatch
//
//  Created by LiWei on 2016/12/12.
//  Copyright © 2016年 LiWei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var labelCount01: UILabel!
  @IBOutlet weak var labelCount02: UILabel!
  
  var isStop = false              // 计时停止标记
  
  @IBAction func btnStart01(_ sender: UIButton) {
    isStop = false
    
    let golbalQueue = DispatchQueue.global()    // 获取GCD全局异步队列
    golbalQueue.async {                         // 调用async方法，创建异步任务
      for i in 1...10000 {
        if (self.isStop) {
          break
        }
        Thread.sleep(forTimeInterval: 0.001)        // 线程休眠
        // 主线程异步执行（主线程同步可能会死锁）
        DispatchQueue.main.async(execute: {       // 获取主线程队列，调用async方法
          self.labelCount01.text = "\(i) ms"
        })
      }
    }
  }
  
  @IBAction func btnStart02(_ sender: UIButton) {
    isStop = false
    DispatchQueue.global().async {
      for i in 1...100000 {
        if (self.isStop) {
          break
        }
        Thread.sleep(forTimeInterval: 0.001)
        DispatchQueue.main.async(execute: {
          self.labelCount02.text = "\(i) ms"
        })
      }
    }
  }
  
  @IBAction func btnStop(_ sender: UIButton) {
    isStop = true
  }
}

