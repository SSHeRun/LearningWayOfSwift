//
//  ViewController.swift
//  TestfieldAnimate
//
//  Created by 李巍 on 2017/11/7.
//  Copyright © 2017年 李巍. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    var m_dKeyboardHeight: CGFloat = 300        // 键盘高度
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 创建文本域
        let textField = UITextField(frame: CGRect(x: 20, y: self.view.bounds.size.height - 100, width: self.view.bounds.size.width - 40, height: 30))
        textField.borderStyle = .roundedRect
        textField.delegate = self
        self.view.addSubview(textField)
        
        // ------ keyboard notification ------
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
    }
    
    // MARK: keyboard notification
    @objc func keyboardWillShow(aNotification: NSNotification) {
        let userinfo = aNotification.userInfo
        let nsValue = userinfo![UIKeyboardFrameEndUserInfoKey] as! NSValue
        let keyboardRec = nsValue.cgRectValue
        m_dKeyboardHeight = keyboardRec.size.height
    }
    
    // MARK: TextField Delegate
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.3, animations: {
            self.view.frame.origin.y = 0 - self.m_dKeyboardHeight
        })
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.3) {
            self.view.frame.origin.y = 0
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

