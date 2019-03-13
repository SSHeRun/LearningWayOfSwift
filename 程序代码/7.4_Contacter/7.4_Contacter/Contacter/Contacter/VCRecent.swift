//
//  VCRecent.swift
//  Contacter
//
//  Created by 李巍 on 2018/11/29.
//  Copyright © 2018年 LW. All rights reserved.
//

import UIKit

class VCRecent: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 64, width: self.view.bounds.width, height: 622))
        imageView.image = UIImage(named: "Recent_Screenshot")
        self.view.addSubview(imageView)
    }
}
