//: [Previous](@previous)

import Foundation

/*
 函数的格式如下
 func 函数名(参数列表) -> 返回值类型 {
 代码块
 return 返回值
 }
 
 func是关键字,多个参数列表之间可以用逗号（,）分隔，也可以没有参数
 使用箭头“->”指向返回值类型
 如果函数没有返回值，返回值为Void.并且“-> 返回值类型”部分可以省略
 */


func greet1(person: String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
}

print(greet1(person: "Anna"))

// 多个返回值
func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

let bounds = minMax(array: [8, -6, 2, 109, 3, 71])

// 指定参数标签
func someFunction(argumentLabel parameterName: Int) {
    // In the function body, parameterName refers to the argument value
    // for that parameter.
}
func greet(person: String, from hometown: String) -> String {
    return "Hello \(person)! Glad you could visit from \(hometown)"
}

greet(person: "Bill", from: "Cupertion")
// 省略参数标签
func someFunction(_ firstParameterName: Int, secondParameterName: Int) {
    // In the function body, firstParameterName and secondParameterName
    // refer to the argument values for the first and second parameters.
}
someFunction(1, secondParameterName: 2)
// 默认参数值
func someFunction(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) {
    // If you omit the second argument when calling this function, then
    // the value of parameterWithDefault is 12 inside the function body.
}
someFunction(parameterWithoutDefault: 3, parameterWithDefault: 6) // parameterWithDefault is 6
someFunction(parameterWithoutDefault: 4) // parameterWithDefault is 12

/*
 注意三: 可变参数
 swift中函数的参数个数可以变化，它可以接受不确定数量的输入类型参数
 它们必须具有相同的类型
 我们可以通过在参数类型名后面加入（...）的方式来指示这是可变参数
 */
func Msum(numbers : Double...) -> Double {
    var total : Double = 0
    for number in numbers {
        total += number
    }
    return total
}
Msum(numbers: 100.0,20,30,40,50)
Msum(numbers: 30,80)


// In-Out参数
// 函数一:值传递
func swap(a : Int, b : Int) {
    var a = a
    var b = b
    let temp = a;
    a = b;
    b = temp
    
    print("a:\(a), b:\(b)")
}

var x = 10
var y = 20
swap(a: x, b: y)
print("x:\(x), y:\(y)")

// 函数二:指针的传递
func swap1(_ a : inout Int , _ b : inout Int) {
    let temp = a
    a = b
    b = temp
    print("a:\(a), b:\(b)")
}
swap1(&x, &y)
print("x:\(x), y:\(y)")







//: [Next](@next)
