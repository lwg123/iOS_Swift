//: [Previous](@previous)

import Foundation

/*
 一个类可以继承（inherit）另一个类的方法（methods），属性（property）和其它特性,
 在 Swift 中，继承是区分「类」与其它类型的一个基本特征
 可以为类中继承来的属性添加属性观察器（property observer),当属性值改变时，类就会被通知到
 */
// 定义一个基类
class Vehicle {
    var numberOfWheels: Int
    var maxPassengers: Int
    func description() -> String {
        return "\(numberOfWheels) wheels; up to \(maxPassengers) passengers"
    }
    init() {
        numberOfWheels = 0
        maxPassengers = 1
    }
}
// 构造器的最简单形式就像一个没有参数的实例方法，使用init关键字:
//init() {
//    // 执行构造过程
//}
// 创建实例
let someVehicle = Vehicle()

//子类生成（Subclassing）指的是在一个已有类的基础上创建一个新的类。子类继承超类的特性，并且可以优化或改变它。你还可以为子类添加新的特性
class Bicycle: Vehicle {
    override init() {
        super.init()
        numberOfWheels = 2
    }
}
let bicycle = Bicycle()
print("Bicycle: \(bicycle.description())")

// 重写（Overriding）
/*
 子类可以为继承来的实例方法（instance method），类方法（class method），实例属性（instance property），或附属脚本（subscript）提供自己定制的实现（implementation）。我们把这种行为叫重写（overriding）
 
 在合适的地方，你可以通过使用super前缀来访问超类版本的方法，属性或附属脚本：
 在方法someMethod的重写实现中，可以通过super.someMethod()来调用超类版本的someMethod方法。
 在属性someProperty的 getter 或 setter 的重写实现中，可以通过super.someProperty来访问超类版本的someProperty属性。
 在附属脚本的重写实现中，可以通过super[someIndex]来访问超类版本中的相同附属脚本
 */

class Car: Vehicle {
    var speed: Double = 0.0
    override init() {
        super.init()
        maxPassengers = 5
        numberOfWheels = 4
    }
    override func description() -> String {
        return super.description() + ";" + " traveling at \(speed) mph"
    }
}

let car = Car()
print("Car: \(car.description())")

//重写属性的Getters和Setters
class SpeedLimitedCar: Car {
    override var speed: Double {
        get {
            return super.speed
        }
        
        set {
            super.speed = min(newValue, 40.0)
        }
    }
}
let limitedCar = SpeedLimitedCar()
limitedCar.speed = 60.0
print("SpeedLimitedCar: \(limitedCar.description())")

// 重写属性观察器（Property Observer）
final class AutomaticCar: Car {
    var gear = 1
    override var speed: Double {
        didSet {
            gear = Int(speed / 10.0) + 1
        }
    }
    override func description() -> String {
        return super.description() + "in gear \(gear)"
    }
}

let automatic = AutomaticCar()
automatic.speed = 35.0
print(automatic.description())


// 防止重写
/*
 你可以通过把方法，属性或附属脚本标记为final来防止它们被重写，只需要在声明关键字前加上final特性即可。（例如：final var, final func, final class func, 以及 final subscript）
 */









//: [Next](@next)
