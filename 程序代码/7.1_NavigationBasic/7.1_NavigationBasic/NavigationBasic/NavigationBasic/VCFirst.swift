//
//  VCFirst.swift
//  NavigationBasic
//
//  Created by 李巍 on 2017/11/21.
//  Copyright © 2017年 李巍. All rights reserved.
//

import UIKit

class VCFirst: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.backgroundColor = UIColor.yellow
    
    // 设置导航控制器
    self.navigationItem.title = "第一页"
    
    // 设置导航栏左侧和右侧按钮
    let leftBtn = UIBarButtonItem(title: "编辑", style: .done, target: self, action: #selector(navLeftBtn))
    self.navigationItem.leftBarButtonItem = leftBtn
    
    let rightBtn = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(navRightBtn))
    self.navigationItem.rightBarButtonItem = rightBtn
    
    // 设置背景颜色风格
    self.navigationController?.navigationBar.barStyle = .black
    
    
    let button = UIButton(frame: CGRect(x: 20, y: 100, width: self.view.bounds.size.width - 40, height: 30))
    button.addTarget(self, action: #selector(btnAction), for: .touchDown)
    button.setTitle("跳转", for: .normal)
    button.setTitleColor(UIColor.black, for: .normal)
    self.view.addSubview(button)
  }
  
  @objc func btnAction() {
    let vcSecond = VCSecond()
    self.navigationController?.pushViewController(vcSecond, animated: true)
  }
    
    @objc func navLeftBtn() {
        print("导航栏左侧按钮按下")
    }
    
    @objc func navRightBtn() {
        print("导航栏右侧按钮按下")
    }
}
