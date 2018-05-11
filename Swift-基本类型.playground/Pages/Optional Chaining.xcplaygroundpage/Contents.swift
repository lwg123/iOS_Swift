//: [Previous](@previous)

import Foundation

/*
 自判断链接可替代强制拆包
 */

class Person {
    var residence: Residence?
}

class Residence {
    var numberOfRooms = 1
}

let john = Person()
// 强制解包可能会出错
// let roomCount = john.residence!.numberOfRooms
// 使用自判断方式
if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}

// 错误处理
// 错误枚举
enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}
throw VendingMachineError.insufficientFunds(coinsNeeded: 5)

// Handling Errors
/*
 do {
    try expression
    statements
 } catch pattern 1 {
    statements
 } catch pattern 2 where condition {
    statements
 }
 */













//: [Next](@next)
