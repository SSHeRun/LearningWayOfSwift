//
//  main.swift
//  Extension
//
//  Created by Li Wei on 16/9/19.
//  Copyright © 2016年 W.Li. All rights reserved.
//

import Foundation


// --------------------------------------------------
// 扩展自定义类
class Person {
    var firstName = "Wei"
    var lastName = "Li"
    var age = 33
}

extension Person {
    var fullName: String {      // 扩展计算属性
        return lastName+" "+firstName
    }
    func getAge() -> Int {      // 扩展方法
        return age
    }
}
var p = Person()
print(p.fullName)
print(p.getAge())
print("--------------------------------------")


////////////////////////////////////////////////////
// 扩展练习：扩展双精度类，具有厘米和千米转换成米的功能
extension Double {
    var km: Double {
        return self * 1000.0
    }
    var m: Double {
        return self
    }
    var cm: Double {
        return self/100.0
    }
}

let cmTest = 10.5.cm
print("10.5cm is \(cmTest) meters")
let kmTest = 10.5.km
print("10.5km is \(kmTest) meters")
print("-------------------------------------------------")




///////////////////////////////////
//扩展构造器
class MyClass {
    var a: Int
    init() {
        a = 10
    }
}

extension MyClass {
    convenience init(parm: Int) {
        self.init()
        a = parm
        print("扩展构造器->便利构造器，\(a)")
    }
}

var myClass = MyClass(parm: 9)
print("-------------------------------------------------")




/////////////////////////////////////////////////////////
// 扩展方法
extension Int {
    func myIntFunc() {
        print("The value is: \(self)")
    }
    mutating func myModifySelfValue() { // mutating关键字修饰方法，表明改方法可以修改变量
        self = self*self    //修改 self 实例的值
    }
}
var test = 2
test.myIntFunc()
test.myModifySelfValue()
print(test)
print("-------------------------------------------------")




/////////////////////////////////////////
// 扩展下标
extension String {
    subscript(index: Int) -> String {
        if index > self.characters.count {
            return ""
        }
        var c: String = ""
        var i = 0
        
        for character in self.characters {
            if (i == index) {
                c = String(character)
                break
            }
            i = i+1
        }
        return c
    }
}

let s = "The quick brown fox jumps over the lazy dog"
print(s[0])
print("ABC"[2])
print("-------------------------------------------------")
