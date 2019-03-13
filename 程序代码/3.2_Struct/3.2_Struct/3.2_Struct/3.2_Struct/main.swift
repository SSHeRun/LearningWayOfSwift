//
//  main.swift
//  3.2_Struct
//
//  Created by 李巍 on 2018/9/10.
//  Copyright © 2018年 李巍. All rights reserved.
//

import Foundation

//////////////////////////////////////////
// 1. 结构体：创建学生信息结构体
struct Student {
    var name: String
    var id: String
    var iOS: Int
}

var stu = Student(name: "kangping", id: "20151101xx", iOS: 90)
print(stu)
stu.iOS = 95
print(stu)
