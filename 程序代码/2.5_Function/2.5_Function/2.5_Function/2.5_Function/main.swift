//
//  main.swift
//  2.5_Function
//
//  Created by 李巍 on 2018/9/3.
//  Copyright © 2018年 李巍. All rights reserved.
//

import Foundation

//////////////////////////////////////////////
// 1. 函数练习：编写函数，计算两个整数之和
func add(number1 n1:Int, number2 n2:Int)->Int {
    return n1+n2
}

print(add(number1: 1, number2: 2))


//////////////////////////////////////////////
// 2. 函数练习：计算数组中所有大于10的数的平均值
func average(arr:[Double])->Double{
    var count = 0
    var sum:Double = 0.0
    
    for item in arr {
        if item > 10 {
            sum += item
            count += 1
        }
    }
    
    return sum / Double(count)
}

var arr:[Double] = [5, 10, 20]

print(average(arr: arr))





//////////////////////////////////////////////
// 3. 函数练习：练习函数嵌套
func evenNumber(threshold: Int) {
    var number = 0
    func add2() {
        number += 2
    }
    
    while number < threshold {
        print(number)
        add2()
    }
}

evenNumber(threshold: 15)



//////////////////////////////////////////////
// 4. 函数练习：函数数据类型
func getSmaller(number1: Int, number2: Int)->Int {
    return ((number1 < number2) ? number1:number2)
}
func getBigger(number1: Int, number2: Int)->Int {
    return ((number1 > number2) ? number1:number2)
}
func printMathResult(mathFunction: (Int, Int)->Int, num1: Int, num2: Int) {
    print("The result is: \(mathFunction(num1, num2))")
}

printMathResult(mathFunction: getSmaller, num1: 1, num2: 2)
printMathResult(mathFunction: getBigger, num1: 1, num2: 2)


/////////////////////////////////////////////
// 5. 函数作为返回值
func makeIncrementer()->((Int)->Int){
    func addOne(number:Int)->Int{
        return number+1
    }
    return addOne
}

var increment = makeIncrementer()
print(increment(7))
