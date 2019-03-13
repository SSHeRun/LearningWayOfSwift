//
//  main.swift
//  2.3_ControlStream
//
//  Created by 李巍 on 2018/9/3.
//  Copyright © 2018年 李巍. All rights reserved.
//

import Foundation

// 课堂演示2.3：控制流。
// 内容（1）：计算1-100之和
// 内容（2）：计算13的阶乘
// 内容（3）：计算100以内的斐波那契数列

/////////////////////////////////////
// 1. 计算1-100之和
var sum = 0
var index = 1

while index <= 100 {
    sum += index
    index += 1
}

print("0-100之和是：\(sum)")




/////////////////////////////////////
// 2. 计算13的阶乘
var result = 1
var n = 13

while n > 0 {
    result *= n
    n -= 1
}

print("13的阶乘是：\(result)")




//////////////////////////////////////
// 2. 计算100以内的斐波那契数列
var value1 = 1
var value2 = 1
var value3 = 0

var str = "1 1 "

while true {
    value3 = value1 + value2
    
    if value3 < 100 {
        str += "\(value3) "
        value1 = value2
        value2 = value3
    } else {
        break
    }
}

print("100以内斐波那契数列是：\(str)")


