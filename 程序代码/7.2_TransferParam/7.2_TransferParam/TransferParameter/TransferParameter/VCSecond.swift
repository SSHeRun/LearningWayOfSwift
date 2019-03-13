//
//  VCSecond.swift
//  TransferParameter
//
//  Created by 李巍 on 2017/11/26.
//  Copyright © 2017年 李巍. All rights reserved.
//

import UIKit

protocol EditBgColorDelegate {
  func fetchBgColor(_ color: UIColor)
}

class VCSecond: UIViewController {
  
  public var delegate: EditBgColorDelegate?
  
  public var blockSetColor: ((UIColor) -> ())?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.navigationItem.title = "第二页"
    
    let button1 = UIButton(frame: CGRect(x: 20, y: 200, width: self.view.bounds.size.width - 40, height: 30))
    button1.addTarget(self, action: #selector(btn1Action(button:)), for: .touchDown)
    button1.setTitle("设置上一页背景为红色（参数方法）", for: .normal)
    button1.setTitleColor(UIColor.red, for: .normal)
    button1.layer.backgroundColor = UIColor.lightGray.cgColor
    self.view.addSubview(button1)
    
    let button2 = UIButton(frame: CGRect(x: 20, y: 260, width: self.view.bounds.size.width - 40, height: 30))
    button2.addTarget(self, action: #selector(btn2Action(button:)), for: .touchDown)
    button2.setTitle("设置上一页背景为蓝色（代理方法）", for: .normal)
    button2.setTitleColor(UIColor.blue, for: .normal)
    button2.layer.backgroundColor = UIColor.lightGray.cgColor
    self.view.addSubview(button2)
    
    let button3 = UIButton(frame: CGRect(x: 20, y: 320, width: self.view.bounds.size.width - 40, height: 30))
    button3.addTarget(self, action: #selector(btn3Action(button:)), for: .touchDown)
    button3.setTitle("设置上一页背景为绿色（闭包方法）", for: .normal)
    button3.setTitleColor(UIColor.green, for: .normal)
    button3.layer.backgroundColor = UIColor.lightGray.cgColor
    self.view.addSubview(button3)
  }
  
  @objc func btn1Action(button: UIButton) {   // 通过参数回传数据
    
    let vc1 = self.navigationController?.viewControllers[(self.navigationController?.viewControllers.count)! - 2] as! VCFirst
    
    vc1.setBgColor(color: UIColor.red)
    
    _ = self.navigationController?.popViewController(animated: true)
  }
  
  @objc func btn2Action(button: UIButton) {   // 代理方法
    
    if delegate != nil {
      delegate!.fetchBgColor(UIColor.blue)
    }
  }
  
  @objc func btn3Action(button: UIButton) {   // 闭包方法
    blockSetColor!(UIColor.green)
  }
  
  // 设置背景颜色属性值
  public func setBgColor(color: UIColor) {
    self.view.backgroundColor = color
  }
}
