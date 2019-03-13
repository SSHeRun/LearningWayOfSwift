//
//  VCFirst.swift
//  PassByValue
//
//  Created by LiWei on 2016/12/5.
//  Copyright © 2016年 LiWei. All rights reserved.
//

import UIKit

class VCFirst: UIViewController {

    var vcTBSecond: UIViewController!
    
    var vcNavItem: VCThird!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vcNavItem = VCThird()
        
        self.view.backgroundColor = UIColor.cyan
        
        let btnTBChangeColor = UIButton()
        btnTBChangeColor.frame.origin = CGPoint(x: 0, y: 100)
        btnTBChangeColor.frame.size = CGSize(width: self.view.frame.size.width, height: 30)
        btnTBChangeColor.setTitle("修改分栏控制器视图颜色", for: .normal)
        btnTBChangeColor.backgroundColor = UIColor.blue
        btnTBChangeColor.addTarget(self, action: #selector(changeTBItem), for: .touchDown)
        
        self.view.addSubview(btnTBChangeColor)
        
        let btnNavChangeColor = UIButton()
        btnNavChangeColor.frame.origin = CGPoint(x: 0, y: 150)
        btnNavChangeColor.frame.size = CGSize(width: self.view.frame.size.width, height: 30)
        btnNavChangeColor.setTitle("修改导航控制器视图颜色", for: .normal)
        btnNavChangeColor.backgroundColor = UIColor.blue
        btnNavChangeColor.addTarget(self, action: #selector(changeNav), for: .touchDown)
        self.view.addSubview(btnNavChangeColor)
    }
    
    func changeTBItem() {
        vcTBSecond.view.backgroundColor = randomColor()
    }
    
    func changeNav() {
        vcNavItem.view.backgroundColor = randomColor()
        self.navigationController?.pushViewController(vcNavItem, animated: true)
    }
    
    func randomColor() -> UIColor {
        switch arc4random() % 5 {
        case 0: return UIColor.red
        case 1: return UIColor.blue
        case 2: return UIColor.yellow
        case 3: return UIColor.purple
        case 4: return UIColor.orange
        default: return UIColor.black
        }
    }
}
