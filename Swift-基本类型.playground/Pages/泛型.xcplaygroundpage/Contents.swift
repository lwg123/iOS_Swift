//: [Previous](@previous)

import Foundation

/*
 泛型代码可以确保你写出灵活的，可重用的函数和定义出任何你所确定好的需求的类型。你的可以写出避免重复的代码，并且用一种清晰的，抽象的方式表达出来
 */

func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swap(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")

// 泛型表达方法
func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temp = a
    a = b
    b = temp
}

var someInt1 = 3
var anotherInt1 = 107
swapTwoValues(&someInt1, &anotherInt1)
print("someInt is now \(someInt1), and anotherInt is now \(anotherInt1)")

var someString = "hello"
var anotherString = "world"
swapTwoValues(&someString, &anotherString)
someString
anotherString

// 非泛型版本的栈（Int）
struct IntStack {
    var items = [Int]()
    mutating func push(_ item: Int){
        items.append(item)
    }
    
    mutating func pop() -> Int {
        return items.removeLast()
    }
}


// 压栈出栈 泛型模式
struct Stack<Element> {
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}

// 扩展泛型类型
extension Stack {
    var topItem: Element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}

/*
 在一个类型参数名后面放置一个类名或者协议名，并用冒号进行分隔，来定义类型约束，它们将成为类型参数列表的一部分
 
 func someFunction<T: SomeClass, U: SomeProtocol>(someT: T, someU: U) {
 // 这里是泛型函数的函数体部分
 }
 
 */

protocol Container {
    associatedtype ItemType
    mutating func append(item: ItemType)
    var count: Int { get }
    subscript(i: Int) -> ItemType { get }
}



// 泛型Where语句
/*
 通过 where 子句要求一个关联类型遵从某个特定的协议，以及某个特定的类型参数和关联类型必须类型相同
 */
func allItemsMatch<C1:Container, C2:Container>(_ someContainer: C1, _ anotherContainer: C2) -> Bool where C1.ItemType == C2.ItemType,C1.ItemType: Equatable {
    // 检查两个容器含有相同数量的元素
    if someContainer.count != anotherContainer.count {
        return false
    }
    // 检查每一对元素是否相等
    for i in 0..<someContainer.count {
        if someContainer[i] != anotherContainer[i] {
            return false
        }
    }
    // 所有元素都匹配，返回 true
    return true
    
}
// 使用
var stackOfStrings = Stack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("tres")

var arrayOfStrings = ["uno", "dos", "tres"]

//if allItemsMatch(stackOfStrings, arrayOfStrings) {
//    print("All items match")
//} else {
//    print("Not all items match")
//}




//: [Next](@next)
