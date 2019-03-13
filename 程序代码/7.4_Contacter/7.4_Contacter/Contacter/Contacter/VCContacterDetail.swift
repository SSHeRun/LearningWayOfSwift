//
//  VCContacterDetail.swift
//  NavigationContacter
//
//  Created by 李巍 on 2018/11/29.
//  Copyright © 2018年 LW. All rights reserved.
//

import UIKit

class VCContacterDetail: UIViewController {
    var imageHeader: UIImage!
    var strName: String!
    var strID: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white       // 设置背景颜色
        
        // 初始化UI对象
        let imageView = UIImageView(frame: CGRect(x: (self.view.bounds.size.width - 200.0) / 2.0, y: 100, width: 200, height: 200))
        imageView.image = imageHeader
        imageView.layer.cornerRadius = imageView.bounds.size.width / 2.0
        imageView.layer.masksToBounds = true
        self.view.addSubview(imageView)
        
        let labelName = UILabel(frame: CGRect(x: 0, y: 350, width: self.view.bounds.width, height: 30))
        labelName.text = strName
        labelName.textAlignment = .center
        labelName.font = UIFont.systemFont(ofSize: 30)
        self.view.addSubview(labelName)
        
        let labelID = UILabel(frame: CGRect(x: 0, y: 400, width: self.view.bounds.width, height: 30))
        labelID.text = strID
        labelID.textAlignment = .center
        self.view.addSubview(labelID)
        
        self.navigationItem.title = "个人信息"
        

    }
}
