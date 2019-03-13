//
//  CustomView.swift
//  addCustonView
//
//  Created by Li Wei on 2016/10/31.
//  Copyright © 2016年 LiWei. All rights reserved.
//

import UIKit

class CustomView: UIView {
    // 一些构造函数
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = UIColor.white
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
    }
    
    // 重载draw方法，每次视图重绘都会调用draw方法
    override func draw(_ rect: CGRect) {
        drawTri()
    }
    
    // 画出三角形
    func drawTri() {
        //只要三个点就行跟画一条线方式一样，把三点连接起来
        if let ctx = UIGraphicsGetCurrentContext() {
            var sPoints = [CGPoint]()//坐标点
            sPoints.insert(CGPoint(x: self.frame.size.width / 2, y: 0), at: 0)
            sPoints.insert(CGPoint(x: 0, y: self.frame.size.width), at: 1)
            sPoints.insert(CGPoint(x: self.frame.size.width, y: self.frame.size.width), at: 2)
            ctx.addLines(between: sPoints)//添加线
            ctx.closePath()//封起来
            //ctx.setFillColor(UIColor.blue.cgColor)
            ctx.setFillColor(randomColor().cgColor)
            ctx.setStrokeColor(UIColor.white.cgColor)
            ctx.setLineWidth(1)
            ctx.drawPath(using: .fillStroke)//根据坐标绘制路径
        }
    }
    
    // 随机颜色
    func randomColor() -> UIColor {
        switch (arc4random() % 5) {
        case 0: return UIColor.red
        case 1: return UIColor.blue
        case 2: return UIColor.green
        case 3: return UIColor.brown
        case 4: return UIColor.cyan
        default: return UIColor.black
        }
    }
}
