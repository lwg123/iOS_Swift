//: [Previous](@previous)

// Value Type  VS Reference Type
import Foundation

/*
 区别：
当你需要值语义（值语义是指一个对象被系统标准的复制方式复制之后，与被复制的对象之间毫无关系，彼此独立改变且互不影响）的时候使用结构体，当你需要引用语义（引用语义是指一个对象被系统标准的复制方式复制后，与被复制的对象之间依然共享底层资源，对其中一个的改变都将影响到另外一个）的时候使用类。就是这样！
 
 结论：
 无论什么时候只要你移动一个值类型，它都会被拷贝，而引用类型只是产生了对同样的底层对象的一个新的引用。那也就意味着引用类型的改变对所有其他的引用都是可见的，而改变值类型只影响你改变的那块内存区域。当选择使用哪种类型时，考虑你的类型是否适合被拷贝，当类型从本质上来说是可拷贝时倾向使用值类型。最后，记住如果你在值类型中嵌入引用类型，不小心的话就会出错！
 */

class SomeClass {
    var number: Int = 0
}

struct SomeStruct {
    var number: Int = 0
}

var reference = SomeClass()
reference.number = 42
var reference2 = reference
reference.number = 43
print("The number in reference2 is \(reference2.number)")

var value = SomeStruct()
value.number = 42
var value2 = value
value.number = 43
print("The number in value2 is \(value2.number)")












//: [Next](@next)
