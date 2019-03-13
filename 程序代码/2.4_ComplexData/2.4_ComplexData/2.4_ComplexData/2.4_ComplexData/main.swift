//
//  main.swift
//  2.4_ComplexData
//
//  Created by 李巍 on 2018/9/3.
//  Copyright © 2018年 李巍. All rights reserved.
//

import Foundation

// 课堂演示2.4 复杂数据类型（1）：数组。
// 内容：创建字符串数组，存入一些动物名称，进行数组常用操作练习

// 创建数组
var array = [String]()          // 常用
var array2 = Array<String>()
var array3 = ["小猫", "小狗", "小鸟"]

//判断数组是否为空
print(array.isEmpty)

//添加数组元素
array.append("小猫")
array.append("小狗")
array += ["小鸟"]
print(array)

//判断数组是否为空
print(array.isEmpty)

//在指定位置添加元素
array.insert("小鱼", at: 1)
print(array)

//数组元素个数
print(array.count)

//数组遍历
for item in array {
    print(item)
}

//删除最后一个
array.removeLast()
print(array)

//删除指定位置元素
array.remove(at: 1)
print(array)

//删除所有元素
array.removeAll()
print(array.isEmpty)
print(array)



// -----------------------------------------------------
// 课堂演示2.4 复杂数据类型（1）：数组。
// 内容（1）：使用字典存储水果名称及其价格
// 内容（2）：使用字典存储我们主要城市的电话区号
///////////////////////////////////////////
// 1. 使用字典存储水果名称及其价格

//创建字典
var dic = ["苹果":6.5, "葡萄":5.0, "桔子":3.0]
print(dic)


// 增加元素
dic["哈密瓜"] = 7.5
print(dic)

// 删除元素
dic.removeValue(forKey: "苹果")
print(dic)

// 遍历所有key
for key in dic.keys {
    print(key)
}

// 遍历字典
for (key, value) in dic {
    print("\(key)的价格是\(value)元")
}










