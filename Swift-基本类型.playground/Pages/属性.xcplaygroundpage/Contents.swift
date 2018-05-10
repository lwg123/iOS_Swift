//: [Previous](@previous)

import Foundation

// 存储属性
struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
// the range represents integer values 0, 1, and 2
rangeOfThreeItems.firstValue = 6
// the range now represents integer values 6, 7, and 8

// 懒加载属性
class DataImporter {
    var fileName = "data.txt"
}

class DataManger {
    lazy var importer = DataImporter()
    var data = [String]()
}

let manger = DataManger()
manger.data.append("Some data")
manger.data.append("Some more data")
print(manger.importer.fileName)

// 计算属性
struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}

var square = Rect(origin: Point(x: 0.0, y:0.0), size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)
print("square.origin is now at (\(square.origin.x), \(square.origin.y))")

// 如果计算属性的setter并不需要设置确定的名称，可以使用默认参数newValue
struct AlternativeRect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}

// 属性监听
class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) { // 自己设置一个名字newTotalSteps
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue  { // 也可以使用默认名字oldValue
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}

let stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 360

// 全局变量和局部变量
// 全局的常量和变量都是懒加载形式，但是不像懒加载存储属性，全局的不需要lazy标记
// 局部变量和常量没有懒加载形式












//: [Next](@next)
