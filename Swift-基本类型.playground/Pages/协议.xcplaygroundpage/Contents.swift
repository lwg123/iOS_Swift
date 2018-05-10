//: [Previous](@previous)

import Foundation

/*
 定义协议与定义类，结构，枚举非常相似
 */

protocol SomeProtocol {
    // protocol definition goes here
}

/*
  定制类型状态，他们采用一种特定的协议，通过将协议名方在类型名之后，用冒号分割，当作定义的一部分。可以列出多个协议，由逗号分隔：
 */

//struct SomeStructure: FirstProtocol, AnotherProtocol {
//    // protocol definition goes here
//}

//class SomeClass: SomeSuperclass, FirstProtocol, AnotherProtocol {
//    // protocol definition goes here
//}

// 属性要求
/*
 属性要求总是声明为变量属性，用var关键字做前缀。可获取和可设置属性是通过在他们类型声明后编写{ get set }方法，并且可获取属性是通过编写{ get }方法。
 */

//protocol SomeProtocol {
//    var mustBeSettable: Int { get set }
//    var doesNotNeedToBeSettable: Int { get }
//}

protocol FullyNamed {
    var fullName: String { get }
}

struct Person: FullyNamed {
    var fullName: String
}
var john = Person(fullName: "John Appleseed")
john.fullName
john.fullName = "niaho"

class Starship: FullyNamed {
    var prefix: String?
    var name: String
    
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    var fullName: String {
        return (prefix != nil ? prefix! + " " : "") + name
    }
    
}
var ncc1701 = Starship(name: "Enterprise", prefix: "USS")
ncc1701.name

// 方法要求
//protocol SomeProtocol {
//    static func someTypeMethod()
//}

protocol RandomNumberGenerator {
    func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy:m))
        return lastRandom / m
    }
}
let generator = LinearCongruentialGenerator()
print("Here's a random number:\(generator.random())")
print("And another one: \(generator.random())")

// Mutating方法要求
protocol Togglable {
    mutating func toggle()
}

enum OnOffSwitch: Togglable {
    case Off, On
    mutating func toggle() {
        switch self {
        case .Off:
            self = .On
        case .On:
            self = .Off
        }
    }
}
var lightSwitch = OnOffSwitch.Off
lightSwitch.toggle()

class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}

// 使用扩展补充协议一致性
protocol TextRepresentable {
    var textualDescription: String { get }
}

extension Dice: TextRepresentable {
    var textualDescription: String {
        return "A \(sides)-sided dice"
    }
}
let d12 = Dice(sides: 12, generator: LinearCongruentialGenerator())
print(d12.textualDescription)

// 采用扩展方式声明协议
struct Hamster {
    var name: String
    var textualDescription: String {
        return "A hamster named \(name)"
    }
}
extension Hamster: TextRepresentable {}

let simonTheHamster = Hamster(name: "Simon")
let somethingTextRepresentable: TextRepresentable = simonTheHamster
print(somethingTextRepresentable.textualDescription)

















//: [Next](@next)
