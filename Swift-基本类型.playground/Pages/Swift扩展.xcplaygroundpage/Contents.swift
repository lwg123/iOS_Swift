//: [Previous](@previous)

import Foundation

/*
 Swift 中的扩展可以：
 添加计算型属性和计算静态属性
 定义实例方法和类型方法
 提供新的构造器
 定义下标
 定义和使用新的嵌套类型
 使一个已有类型符合某个接口
 
 extension SomeType {
 // 加到SomeType的新功能写到这里
 }
 
 适配协议
 extension SomeType: SomeProtocol, AnotherProctocol {
 // 协议实现写到这里
 }
 
 */

// 计算属性
extension Double {
    var km: Double {return self * 1_000.0}
    var m: Double {return self}
    var cm: Double {return self / 100.0}
    var mm: Double {return self / 1000.0}
    var ft: Double {return self / 3.28084}
}
let oneInch = 2.54.mm
print("One inch is \(oneInch) meters")
let threeFeet = 3.ft
print("Three feet is \(threeFeet) meters")

// 构造器
struct Size {
    var with = 0.0, height = 0.0
}
struct Point {
    var x = 0.0, y = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
}

let defaultRect = Rect()
let memberwiseRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(with: 5.0, height: 5.0))

extension Rect {
    init(center: Point, size: Size) {
        let originX = center.x - (size.with / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

let centerRect = Rect(center: Point(x: 4.0, y: 4.0),
                      size: Size(with: 3.0, height: 3.0))

// Methods  扩展可以向已有类型添加新的实例方法和类型方法
extension Int {
    func repetitions(task: () -> Void) {
        for _ in 0..<self {
            task()
        }
    }
}
3.repetitions {
    print("Hello!")
}

// 修改实例方法
/*
 通过扩展添加的实例方法也可以修改该实例本身。结构体和枚举类型中修改self或其属性的方法必须将该实例方法标注为mutating，正如来自原始实现的修改方法一样
 */
extension Int {
    mutating func square() {
        self = self * self
    }
}
var someInt = 3
someInt.square()

// 下标
extension Int {
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
        for _ in 0..<digitIndex {
            decimalBase *= 10
        }
        return (self / decimalBase) % 10
    }
}
123456[1]
746381295[2]

// 嵌套类型
extension Int {
    enum Kind {
        case negative, zero, positive
    }
    var kind: Kind {
        switch self {
        case 0:
            return .zero
        case let x where x > 0:
            return .positive
        default:
            return .negative
        }
    }
}

func printIntegerKinds(_ numbers: [Int]) {
    for number in numbers {
        switch number.kind {
        case .negative:
            print("- ", terminator: "")
        case .zero:
            print("0 ", terminator: "")
        case .positive:
            print("+ ", terminator: "")
        }
    }
    print("")
}
printIntegerKinds([3, 19, -27, 0, -6, 0, 7])










//: [Next](@next)
