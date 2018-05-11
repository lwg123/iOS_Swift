//: [Previous](@previous)

import Foundation

/*
 在一个类的实例被释放之前，反初始化函数被立即调用。用关键字deinit来标示反初始化函数，类似于初始化函数用init来标示。反初始化函数只适用于类类型
 */
// 一个类只有一个deinit函数
/*
deinit {
    // perform the deinitialization
}
*/

/*
 Automatic Reference Counting
 
 */
class Person1 {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}
var reference1: Person1?
var reference2: Person1?
var reference3: Person1?

// 一个强引用
reference1 = Person1(name: "John Appleseed")

//将这个Person实例赋值给另外的两个变量，那么将建立另外两个指向这个实例的强引用
reference2 = reference1
reference3 = reference2

//如果你通过赋值nil给两个变量来破坏其中的两个强引用（包括原始的引用），只剩下一个强引用，这个Person实例也不会被销毁：
reference1 = nil
reference2 = nil

// 直到第三个也是最后一个强引用被破坏，ARC才会销毁Person的实例，这时，有一点非常明确，你无法继续使用Person实例：
reference3 = nil
// 打印 “John Appleseed is being deinitialized”

// 类实例间的强引用环 例子
class Person {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment?
    deinit {print("\(name) is being deinitialized") }
}

class Apartment {
    let number: Int
    init(number: Int) { self.number = number }
    var tenant: Person?
    deinit { print("Apartment #\(number) is being deinitialized") }
}

var john: Person?
var number73: Apartment?

john = Person(name: "john Appleseed")
number73 = Apartment(number: 73)
// 相互持有对方
john!.apartment = number73
number73!.tenant = john

// 弱引用
// 消除循环引用，加一个week值
class Apartment1 {
    let unit: String
    init(unit: String) { self.unit = unit }
    weak var tenant: Person?
    deinit { print("Apartment \(unit) is being deinitialized") }
}

// Unowned References 无主引用
/*
 和弱引用不同的是，无主引用默认始终有值。因此，无主引用只能定义为非可选类型（non-optional type）。在属性、变量前添加unowned关键字，可以声明一个无主引用
 */
class Customer {
    let name: String
    var card: CreditCard?
    init(name: String) {
        self.name = name
    }
    deinit { print("\(name) is being deinitialized")}
}

class CreditCard {
    let number: UInt64
    unowned let customer: Customer
    init(number: UInt64, customer: Customer) {
            self.number = number
            self.customer = customer
        }
    deinit { print("Card #\(number) is being deinitialized")}
}

var john1: Customer?
john1 = Customer(name: "John Appleseed")
john1!.card = CreditCard(number: 1234_5678_9012_3456, customer: john1!)

john1 = nil

/*
 Person和Apartment的例子说明了下面的场景：两个属性的值都可能是nil,并有可能产生强引用环。这种场景下适合使用弱引用。
 
 Customer和CreditCard的例子则说明了另外的场景：一个属性可以是nil，另外一个属性不允许是nil，并有可能产生强引用环。这种场景下适合使用无主引用。
 
 存在第三种场景：两个属性都必须有值，且初始化完成后不能为nil。这种场景下，则要一个类用无主引用属性，另一个类用隐式展开的可选属性
 */

class Country {
    let name: String
    var capitalCity: City!
    init(name: String, capitalName: String) {
        self.name = name
        self.capitalCity = City(name: capitalName, country: self)
    }
}

class City {
    let name: String
    unowned let country: Country
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
}

var country = Country(name: "Canada", capitalName: "Ottawa")
print("\(country.name)'s capital city is called \(country.capitalCity.name)")

// 闭包产生的强引用环
/*
 将一个闭包赋值给类实例的某个属性，并且这个闭包使用了实例，这样也会产生强引用环
 */
class HTMLElement {
    
    let name: String
    let text: String?
    
    lazy var asHTML: () -> String = {
        [unowned self] in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

let heading = HTMLElement(name: "h1")
let defaultText = "some default text"
heading.asHTML = {
    return "<\(heading.name)>\(heading.text ?? defaultText)</\(heading.name)>"
}
print(heading.asHTML())

var paragraph: HTMLElement? = HTMLElement(name: "p", text: "Hello world")
print(paragraph!.asHTML())

paragraph = nil // 没有打印deinit,没有销毁

//解决闭包产生的强引用环
/*
 Swift有如下约束：只要在闭包内使用self的成员，就要用self.someProperty或者self.someMethod（而非只是someProperty或someMethod）。这可以提醒你可能会不小心就占有了self
 */
// 定义捕获列表
/*
var someClosure: (Int, String) -> String = {
    [unowned self, weak delegate = self.delegate!] (index: Int, stringToProcess: String) -> String in
    // closure body goes here
}
*/














//: [Next](@next)
