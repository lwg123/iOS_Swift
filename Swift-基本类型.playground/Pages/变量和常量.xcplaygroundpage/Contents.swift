//: [Previous](@previous)

import Foundation
/**
 变量与常量的名称可以包含任何字符，包括Unicode字符；
 但是不能包括空格，数字符号，箭头，私有关键字，数字可以在其他地方但不能在开头
 */
var str = "Hello, playground"
str = "你好"
let π = 3.14159
let 你好 = "你好世界"
let 🐶🐂 = "dogCow"

//let languageName = "Swift"
//languageName = "Swift++"
// This is a compile-time error: languageName cannot be changed.
// 可以使用\()来拼接字符串
var friendlyWelcome = "Hello!"
friendlyWelcome = "Bonjour!"
print("The current value of friendlyWelcome is \(friendlyWelcome)")

//整数
let minValue = UInt8.min
let maxValue = UInt8.max
/*
 On a 32-bit platform, UInt is the same size as UInt32.
 On a 64-bit platform, UInt is the same size as UInt64.
 */

//：浮点数
/*
 Double represents a 64-bit floating-point number.
 Float represents a 32-bit floating-point number.
 */
/*
 Swift 是一种强类型语言，使用时候必须确保变量类型明确
 如果，初始化时未标明类型，swift可以根据初始值进行类型推断
 */
let meaningOfLife = 42  // Int
let p1 = 3.14159 // Double
let anotherPi = 3 + 0.14159 //Double
// 数值转换
let three = 3
let pointOneFourOneFiveNine = 0.14159
let pi = Double(three) + pointOneFourOneFiveNine
// pi equals 3.14159, and is inferred to be of type Double
let integerPi = Int(pi)
// integerPi equals 3, and is inferred to be of type Int

// 类型别名，使用关键字typealias
typealias AudioSample = UInt16
var maxAmplitudeFound = AudioSample.min //AudioSample相当于UInt16

//：布尔值 Bool 非0即真不在成立
let orangesAreOrange = true
let turnipsAreDelicious = false
// 错误做法
//let i = 1
//if i {
//    // this example will not compile, and will report an error
//}
// 正确做法
let i = 1
if i == 1 {
    // this example will compile successfully
}
//：元组
let http404Error = (404, "Not Found")
let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")

print("The status message is \(statusMessage)")

// 如果某个值不需要可以缺省，用‘_’代替
let (justTheStatusCode, _) = http404Error
//:可选类型
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)
//convertedNumber被推断为可选类型，因为一个String可能会转换为Int也可能为nil

//:nil
//你可以设置一个可选类型为nil
var serverResponseCode: Int? = 404
serverResponseCode = nil
var surveyAnswer: String? //如果定义的optional类型没有赋值，将会默认为nil
/**
 注意：swift的nil不同于OC的nil，在oc中nil是一个指向不存在的对象，在swift中nil不是指针，而是缺少值的某类型，任何类型的optional类型都可以设置为nil，不仅仅是对象类型
 */
//: if声明语句可以强制解包optional类型
if convertedNumber != nil {
    print("convertedNumber contains some integer value.")
}
// 如果知道convertedNumber不为空，可以在后面添加(!)强制解包
if convertedNumber != nil {
    print("convertedNumber has an integer value of \(convertedNumber!).")
}
//:可选绑定
//if let constantName = someOptional {
//    statements
//}

if let actualNumber = Int(possibleNumber) {
    print("\"\(possibleNumber)\" has an integer value of \(actualNumber)")
} else {
    print("\"\(possibleNumber)\" could not be converted to an integer")
}
if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100")
}
//:异常处理
func canThrowAnError() throws {
    // this function may or may not throw an error
}

do {
    try canThrowAnError()
    // no error was thrown
} catch {
    // an error was thrown
}
//:Assertions断言
//let age = -3
//assert(age >= 0, "A person's age cannot be less than zero") 出错


























//: [Next](@next)
