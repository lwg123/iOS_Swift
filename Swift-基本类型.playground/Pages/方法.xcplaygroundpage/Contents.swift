//: [Previous](@previous)

import Foundation

// 方法是与特定类型关联的函数，类、结构和枚举都可以定义实例方法
// 实例方法
class Counter {
    var count = 0
    func increment() {
        //count += 1
        self.count += 1
    }
    
    func increment(by amount: Int) {
        count += amount
    }
    
    func reset() {
        count = 0
    }
}

let counter = Counter()
counter.increment()
counter.count
counter.increment(by: 5)
counter.count
counter.reset()
counter.count

// The self Property
// 在同一类里，不需要写self，需要区分时在写
struct Point1 {
    var x = 0.0, y = 0.0
    func isToTheRightOf(x: Double) -> Bool {
        return self.x > x
    }
}
let somePoint = Point1(x: 4.0, y: 5.0)
if somePoint.isToTheRightOf(x: 1.0) {
    print("This point is to the right of the line where x == 1.0")
}

// 从实例方法中修改(value Type)值类型
// mutating 关键字放在func前面
struct Point {
    var x = 0.0, y = 0.0
     mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}

var somPoint = Point(x: 1.0, y: 1.0)
somPoint.moveBy(x: 2.0, y: 3.0)
print("The point is now at (\(somPoint.x), \(somPoint.y))")

// 在常量中不能调用mutating方法
//let fixedPoint = Point(x: 3.0, y: 3.0)
//fixedPoint.moveBy(x: 2.0, y: 3.0)
// this will report an error

// 赋值给self属性
struct Point2 {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        self = Point2(x: x + deltaX, y: y + deltaY)
    }
}

enum TriStateSwitch {
    case off, low, high
    mutating func next() {
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
        }
    }
}
var ovenLight = TriStateSwitch.low
ovenLight.next()
ovenLight.next()







//: [Next](@next)
