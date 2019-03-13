//
//  main.swift
//  TemplateLearning
//
//  Created by Li Wei on 16/9/19.
//  Copyright © 2016年 W.Li. All rights reserved.
//

import Foundation


func isEquals<T: Comparable>(a: T, b: T) -> Bool {
    return (a==b)
}

print(isEquals(a: 1, b: 2))
print(isEquals(a: 2.5, b: 2.50))
print(isEquals(a: "abcd", b: "abcd"))


// -----------------------------------------------
// 泛型类
class Stack<T> {
    var items = [T]()
    func push(item: T) {
        items.append(item)
    }
    func pop() -> T {
        return items.removeLast()
    }
}

var stackInt = Stack<Int>()
stackInt.push(item: 1)
stackInt.push(item: 2)
print(stackInt.pop())
print(stackInt.pop())


