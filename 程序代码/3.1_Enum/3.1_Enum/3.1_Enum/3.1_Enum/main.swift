//
//  main.swift
//  3.1_Enum
//
//  Created by 李巍 on 2018/9/10.
//  Copyright © 2018年 李巍. All rights reserved.
//

import Foundation


/////////////////////////////////
// 枚举
enum Rank:Int{
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    
    func simpleDescription()->String {
        switch self {
        case .Ace: return "ace"
        case .Jack: return "jack"
        case .Queen: return "queen"
        case .King: return "king"
        default:
            return String(self.rawValue)
        }
    }
}

print(Rank.Six.rawValue)
print(Rank.Jack.simpleDescription())



//////////////////////////////
// 1. 简单枚举：保存每周五天工作日并编写description函数
enum WeekDay{
    case Monday
    case Tuesday
    case Wendesday
    case Thursday
    case Friday
    
    func description() {
        switch self {
        case .Monday:
            print("本周工作第一天")
        case .Friday:
            print("就要周末放假了")
        default:
            print("认真工作吧")
        }
    }
}

var day = WeekDay.Monday
print(day)
day.description()
day = .Friday
day.description()
day = .Wendesday
day.description()




