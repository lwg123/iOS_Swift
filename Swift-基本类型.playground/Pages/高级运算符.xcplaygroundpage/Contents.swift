//: [Previous](@previous)

import Foundation

// 位运算符(~),按位取反运算符

let initalBits: UInt8 = 0b00001111
let inverseBits = ~initalBits

// 按位与运算符(&)
let firstSixBits: UInt8 = 0b11111100
let lastSixBits: UInt8 = 0b00111111
let middleFourBits = firstSixBits & lastSixBits

// 按位或运算符（|）
let someBits: UInt8 = 0b10110010
let moreBits: UInt8 = 0b01011110
let combinedbits = someBits | moreBits

// 按位异或运算符(^)
let outputBits = firstSixBits ^ lastSixBits

// 按位左移(<<)、右移运算符(>>)

// 运算符重载
struct Vector2D {
    var x = 0.0, y = 0.0
}
extension Vector2D {
    static func + (left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x + right.x, y: left.y + right.y)
    }
}
let vector = Vector2D(x: 3.0, y: 1.0)
let anotherVector = Vector2D(x: 2.0, y: 4.0)
let combinedVector = vector + anotherVector

// 前缀和后缀运算符
extension Vector2D {
    static prefix func - (vector: Vector2D) -> Vector2D {
        return Vector2D(x: -vector.x, y: -vector.y)
    }
}

// 复合运算符
extension Vector2D {
    static func += (left: inout Vector2D, right: Vector2D) {
        left = left + right
    }
}









//: [Next](@next)
