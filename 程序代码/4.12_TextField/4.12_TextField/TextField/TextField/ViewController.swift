//
//  ViewController.swift
//  TextField
//
//  Created by 李巍 on 2017/10/5.
//  Copyright © 2017年 李巍. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置代理
        textField.delegate = self
        
        // 文本域常用属性
        textField.placeholder = "please enter words"    // 设置占位文字
        
        textField.textColor = UIColor.red               // 设置文字颜色
        
        textField.isSecureTextEntry = true              // 设置密码样式
        
        textField.clearsOnBeginEditing =  true          // 设置编辑时内容清空
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) { // 结束编辑回调方法
        label.text = textField.text
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {  // 按下返回按钮回调方法
        textField.resignFirstResponder()    // 隐藏键盘
        return true
    }
}

