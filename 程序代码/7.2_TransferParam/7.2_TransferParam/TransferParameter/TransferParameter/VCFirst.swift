//
//  VCFirst.swift
//  TransferParameter
//
//  Created by 李巍 on 2017/11/26.
//  Copyright © 2017年 李巍. All rights reserved.
//

import UIKit

class VCFirst: UIViewController, EditBgColorDelegate {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.backgroundColor = UIColor.white
    
    self.navigationItem.title = "第一页"
    
    let button1 = UIButton(frame: CGRect(x: 20, y: 200, width: self.view.bounds.size.width - 40, height: 30))
    button1.tag = 1
    button1.addTarget(self, action: #selector(btnAction(button:)), for: .touchDown)
    button1.setTitle("设置下一页背景为红色", for: .normal)
    button1.setTitleColor(UIColor.red, for: .normal)
    button1.layer.backgroundColor = UIColor.lightGray.cgColor
    self.view.addSubview(button1)
    
    let button2 = UIButton(frame: CGRect(x: 20, y: 260, width: self.view.bounds.size.width - 40, height: 30))
    button2.tag = 2
    button2.addTarget(self, action: #selector(btnAction(button:)), for: .touchDown)
    button2.setTitle("设置下一页背景为蓝色", for: .normal)
    button2.setTitleColor(UIColor.blue, for: .normal)
    button2.layer.backgroundColor = UIColor.lightGray.cgColor
    self.view.addSubview(button2)
  }
  
  @objc func btnAction(button: UIButton) {
    let vc2 = VCSecond()
    
    vc2.delegate = self
    vc2.blockSetColor = setBgColor
    
    if button.tag == 1 {
      vc2.setBgColor(color: UIColor.red)    // 通过对象传递参数
    } else if button.tag == 2 {
      vc2.setBgColor(color: UIColor.blue)
    }
    
    self.navigationController?.pushViewController(vc2, animated: true)
  }
  
  public func setBgColor(color: UIColor) {
    self.view.backgroundColor = color
  }
  
  func fetchBgColor(_ color: UIColor) {
    self.view.backgroundColor = color
  }
}
