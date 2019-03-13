//
//  main.swift
//  3.3_Class
//
//  Created by 李巍 on 2018/9/16.
//  Copyright © 2018年 李巍. All rights reserved.
//

import Foundation

// -----------------------------------------------------
// 课堂练习：定义“形状”类并创建对象
// 定义类
class Shape {
    var numberOfSides = 0           // 成员变量（属性）
    func description() {            // 成员函数（方法）
        print("A shape with \(numberOfSides) sides.")
    }
}

//使用类，创建类的对象
var shape = Shape()                 // 使用构造函数（初始化器）创建类的对象实例
shape.numberOfSides = 8
shape.description()



// -----------------------------------------------------
// 2. 值类型与引用类型的区别
struct S {          // 结构体是值类型
    var data:Int = 1
}
var a = S()
var b = a       // 调用拷贝构造函数构造对象b，a与b是两个不同的对象
a.data = 42
print("\(a.data), \(b.data)")

class C {       // 类是引用类型
    var data:Int = -1
}
var x = C()
var y = x       // 不调用拷贝构造函数，x与y指向内存中相同的对象
x.data = 42
print("\(x.data), \(y.data)")



// ---------------------------------------------------------------
// 3. 类的构造：初始化器与反初始化器基本用法
class NamedShape{
    var numberOfSides:Int = 0
    var name:String
    
    init(name:String) {
        self.name = name
    }
    
    deinit {
        print("\(name)'s shape destructed.")
    }
    
    func simpleDescription()->String{
        return "\(name)'s shape with \(numberOfSides) sides."
    }
}

var shape2 = NamedShape(name: "door")
shape2.numberOfSides = 4
print(shape2.simpleDescription())
shape2 = NamedShape(name: "chair")      // 让swift回收对象，调用析构函数




/////////////////////////////////////////////////////////////
// 4. 类的计算属性: 对于三角形类，使用周长计算属性
class EquilaterTriangle{
    var sideLength:Double       // 存储属性，在内存中保存某个值
    
    init(sideLength:Double){
        self.sideLength = sideLength
    }
    
    var perimeter:Double{       // 计算属性，获得或设置等边三角形周长
        get{    // 获取计算属性的值
            return 3.0*sideLength
        }
        set{
            sideLength = newValue/3.0       // newValue是set传递的值
        }
    }
}

var triangle = EquilaterTriangle(sideLength: 3.1)
print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.sideLength)




/////////////////////////////////////////////////////////////
// 5. 类的计算属性: 对于三角形类，使用周长计算属性
class EquilaterTriangle2{
    var sideLength:Double       // 存储属性，在内存中保存某个值
    
    init(sideLength:Double){
        self.sideLength = sideLength
    }
    
    var perimeter:Double{       // 计算属性，获得或设置等边三角形周长
//        get{    // 获取计算属性的值
            return 3.0*sideLength
//        }
//        set{
//            sideLength = newValue/3.0       // newValue是set传递的值
//        }
    }
}

var triangle2 = EquilaterTriangle2(sideLength: 3.1)
print(triangle2.perimeter)
//triangle2.perimeter = 9.9
//print(triangle2.sideLength)



////////////////////////////////////////////////////////////////////
// 6. 属性观察者：使用属性观察者观察等边三角形边长变化
class EquilaterTriangle3{
    var sideLength:Double = 0.0 {
        willSet {
            print("调用观察者willSet，当前值是：\(sideLength)，边长新值是：\(newValue)")
        }
        didSet {
            print("调用观察者didSet，当前值是：\(sideLength)，边长旧值是：\(oldValue)")
        }
    }
}

var triangle3 = EquilaterTriangle3()
triangle3.sideLength = 10.0
triangle3.sideLength = 20.2



////////////////////////////////////////////////////////////////////
// 7. 类的下标：使用下标返回三角形三边长度
class Triangle{
    var sideLen1 = 3.0
    var sideLen2 = 4.0
    var sideLen3 = 5.0
    
    subscript(sideIndex:Int)->Double{       // 定义类的下标
        switch sideIndex{
        case 1: return sideLen1
        case 2: return sideLen2
        case 3: return sideLen3
        default: return -1
        }
    }
}

var normalTriangle = Triangle()
print(normalTriangle[1])
print(normalTriangle[2])
print(normalTriangle[3])
print(normalTriangle[4])



//////////////////////////////////////////////////////////////////////
// 8. 类的继承：实现正方形类Square，该类继承形状NamedShape类，重写simpleDesription方法，子类中包含求面积方法area
class Square:NamedShape{
    var sideLength:Double
    
    init(sideLength:Double, name:String) {
        self.sideLength = sideLength        // 先初始化子类属性
        super.init(name: name)              // 初始化父类
        numberOfSides = 4                   // 修改父类属性值
    }
    
    func area()->Double{                    // 子类方法
        return sideLength*sideLength
    }
    
    override func simpleDescription() -> String {       // 重写父类方法
        return "A square with sides of length \(sideLength)"
    }
}

let test = Square(sideLength: 5.2, name: "my test square")
print(test.area())
print(test.simpleDescription())



////////////////////////////////
// 9.  便利初始化器
class ClassA{
    let numA:Int
    init(num:Int) {
        numA = num
    }
    convenience init(bigNum:Bool) {
        self.init(num:bigNum ? 10000 : 1)
    }
}

var ObjA = ClassA(bigNum: true)
print(ObjA.numA)

//class ClassB:ClassA{
//    let numB:Int
//    override init(num:Int){
//        numB = num+1
//        super.init(num: num)
//    }
//}
//
//let anObj = ClassB(bigNum: true)
//print(anObj.numA)
//print(anObj.numB)



////////////////////////////////////////
// 10. required keyword
class ClassC{
    let numA:Int
    required init(num:Int) {    // 要求子类有其他初始化器时，必须重写该初始化器
        numA = num
    }
}
class ClassD:ClassC{
    let numB:Int
    let str:String
    required init(num:Int){
        numB = num+1
        self.str = "Hello Kitty"
        super.init(num: num)
    }
    init(str:String, num:Int){
        numB = num+2
        self.str = str
        super.init(num:num)
    }
}
let anObj2 = ClassD(str:"FIFA World Cup 2018 Russia", num:20)
print(anObj2.numA)
print(anObj2.numB)
print(anObj2.str)




/////////////////////////////////////
// 11. 类型检查和转换
class Human{
    
}
class Man:Human{
    
}
class Woman:Human{
    
}
let man = Man()
let woman = Woman()
var arr = [man, woman]

for people in arr{
    if people is Man{
        print("This is man")
    }
    else if people is Woman{
        print("This is woman")
    }
}

for people in arr{
    if ((people as? Man) != nil){
        print("This is man")
    }else if ((people as? Woman) != nil){
        print("This is woman")
    }
}






