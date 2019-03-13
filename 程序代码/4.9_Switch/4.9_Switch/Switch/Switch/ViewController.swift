//
//  ViewController.swift
//  Switch
//
//  Created by 李巍 on 2018/10/22.
//  Copyright © 2018年 李巍. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func switchValueChange(_ sender: UISwitch) {
        if sender.isOn {
            self.view.backgroundColor = UIColor.white
        } else {
            self.view.backgroundColor = UIColor.black
        }
    }
}

