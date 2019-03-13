//
//  main.swift
//  Basic
//
//  Created by 李巍 on 2018/9/3.
//  Copyright © 2018年 李巍. All rights reserved.
//

import Foundation

// ---------------------------------------
// 课堂演示2.2 Swift基础（1）：创建命令行工程。
// 内容：创建一个OS X命令行项目，生成并运行。
print("Hello, My First Swift Project!")



// ---------------------------------------
// 课堂练习2.2 Swift基础（2）：语句与输出。
// 内容：输入字符串“我是xxxx，我喜欢iOS开发”。
print("我是李老师，我喜欢iOS开发")



// ---------------------------------------
// 课堂演示2.2：Swift基础（3）：变量与常量。
// 内容：创建一个常量，常量名为PI，初始值为3.14。创建一个变量，变量名为r，显式指定类型为Double并指定初始值为10。
let PI = 3.14           // let定义常量，自动推断类型为Double
var radius:Double = 10  // var定义变量，显式指定数据类型为Double



// ---------------------------------------
// 课堂演示2.2：Swift基础（4）：元组。
// 内容：使用元组存储你的信息，并输出。
// 1） 定义元组
let myInfo1 = ("liwei", 35)                     // 定义元组
let myInfo2: (String, Int) = ("liwei", 35)
var myInfo3 = (name:"liwei", age:35)            // 定义元组：指定元素名称

// 2)  修改元组
myInfo3.name = "Yu"
myInfo3.age = 60

// 3） 使用元组
print("My name is \(myInfo1.0) and my age is \(myInfo1.1)")
print("My name is \(myInfo2.0) and my age is \(myInfo2.1)")
print("My name is \(myInfo3.name) and my age is \(myInfo3.age)")



// ------------------------------------------
// 课堂演示2.2：Swift基础（5）：可选。
// 内容：编写可选代码，理解Swift可选机制。
var possibleInt: Int? = 0           // 定义可选变量

var myString = "7"
possibleInt = Int(myString)
print(possibleInt)

myString = "banana"
possibleInt = Int(myString)
print(possibleInt)



// ----------------------------------------------
// 课堂演示2.2：Swift基础（6）：运算符。
// 内容：给定半径，计算圆形面积和球形体积。
var r = 10.0
var area = PI*r*r
var volume = 4/3*PI*r*r*r
print("The area is \(area), and the volume is \(volume)")





















