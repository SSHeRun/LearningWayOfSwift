//
//  ViewController.swift
//  TicketSale
//
//  Created by 李巍 on 2017/12/11.
//  Copyright © 2017年 李巍. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var idTicket: Int = 200000     // 模拟票的总数，每张票的ID
  var salerTicketCnt: Int!      // 每个站点售票数量
  var threadLock: NSLock!       // 线程锁
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    salerTicketCnt = idTicket / 2       // 每个站点售票数量
    threadLock = NSLock()               // 构造线程锁对象
    
    // layout
    let btn1 = UIButton(frame: CGRect(x: 20, y: 100, width: self.view.bounds.size.width - 40, height: 30))
    btn1.addTarget(self, action: #selector(btn1Action), for: .touchDown)
    btn1.setTitle("站点1开始售票", for: .normal)
    btn1.layer.backgroundColor = UIColor.lightGray.cgColor
    btn1.setTitleColor(UIColor.black, for: .normal)
    self.view.addSubview(btn1)
    
    let btn2 = UIButton(frame: CGRect(x: 20, y: 200, width: self.view.bounds.size.width - 40, height:30))
    btn2.addTarget(self, action: #selector(btn2Action), for: .touchDown)
    btn2.setTitle("站点2开始售票", for: .normal)
    btn2.layer.backgroundColor = UIColor.lightGray.cgColor
    btn2.setTitleColor(UIColor.black, for: .normal)
    self.view.addSubview(btn2)
  }

  @objc func btn1Action() {
    let thread1 = Thread(target: self, selector: #selector(thread1Action), object: nil)     // 创建进行
    thread1.start()   // 启动进行
  }
  
  @objc func btn2Action() {
    Thread.detachNewThreadSelector(#selector(thread2Action), toTarget: self, with: nil)     // 创建并启动线程
  }
  
  @objc func thread1Action() {    // 线程1目标方法
    for _ in 0..<salerTicketCnt {
      print("站点1：\(idTicket)")    // 模拟售票
      threadLock.lock()             // 线程锁定
      idTicket -= 1                 // 模拟售票，ID自减
      threadLock.unlock()           // 线程解锁
    }
  }
  
  @objc func thread2Action() {    // 线程2目标方法
    for _ in 0..<salerTicketCnt {
      print("站点2：\(idTicket)")    // 模拟售票
      threadLock.lock()             // 线程锁定
      idTicket -= 1                 // 模拟售票，ID自减
      threadLock.unlock()           // 线程解锁
    }
  }
}

