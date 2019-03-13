//
//  ViewController.swift
//  ButtonAnimate
//
//  Created by Li Wei on 2016/11/7.
//  Copyright © 2016年 LiWei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var labelContent: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton(frame: CGRect(x: 20, y: 50, width: self.view.bounds.size.width - 40, height: 40))
        button.setTitle("隐藏内容△", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = UIColor.orange
        button.addTarget(self, action: #selector(btnAction(_:)), for: .touchDown)
        self.view.addSubview(button)
        
        labelContent = UILabel(frame: CGRect(x: 20, y: 100, width: self.view.bounds.size.width - 40, height: 200))
        labelContent.text = "用户名和密码"
        labelContent.textAlignment = .center
        labelContent.backgroundColor = UIColor.orange
        self.view.addSubview(labelContent)
    }

    @objc func btnAction(_ sender: UIButton) {
        if sender.titleLabel?.text == "隐藏内容△" {
            sender.setTitle("显示内容▽", for: .normal)
            UIView.animate(withDuration: 1, delay: 0, options: [], animations: {
                self.labelContent.frame.size.height = 1
                }, completion: {
                    (Bool) -> () in
                    self.labelContent.text = ""
            })
        }
        else if sender.titleLabel?.text == "显示内容▽" {
            sender.setTitle("隐藏内容△", for: .normal)
            UIView.animate(withDuration: 1, delay: 0, options: [], animations: {
                self.labelContent.frame.size.height = 200
                }, completion: {
                    (Bool) -> () in
                    self.labelContent.text = "用户名和密码"
            })
        }
    }
}

