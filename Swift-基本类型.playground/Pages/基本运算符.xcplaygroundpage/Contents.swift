//: [Previous](@previous)

import Foundation

/**:Swift运算符
 
 
 
 */
// :赋值运算符
let b = 10
var a : Int?
a = b

let (x, y) = (1, 2)
// x is equal to 1, and y is equal to 2

/*
 不像C和Objective-C赋值操作符，swift赋值操作符本身不返回一个值。以下语句无效:
 if x = y {
 // This is not valid, because x = y does not return a value.
 }
 */
//:算术运算符
/**
 +  "hello, " + "world" 支持字符
 - 
 * 
 /
 %
 */
9 % 4    // equals 1
// 一元减号运算符 - +
1 == 1   // true because 1 is equal to 1
2 != 1   // true because 2 is not equal to 1
2 > 1    // true because 2 is greater than 1
1 < 2    // true because 1 is less than 2
1 >= 1   // true because 1 is greater than or equal to 1
2 <= 1   // false because 2 is not less than or equal to 1

//:三元运算符 question ? answer1 : answer2
let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)

//:Nil-Coalescing Operator 零压缩算子

a != nil ? a! : b  // 用于可选类型解包

let defaultColorName = "red"
var userDefinedColorName: String?   // defaults to nil

var colorNameToUse = userDefinedColorName ?? defaultColorName

// :Closed Range Operator 区间
//闭区间
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}
//半开区间
let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("Person \(i + 1) is called \(names[i])")
}
/**
 逻辑运算符
 Logical NOT (!a)
 Logical AND (a && b)
 Logical OR (a || b)
 */


















//: [Next](@next)
