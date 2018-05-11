//: [Previous](@previous)

import Foundation

/*
 Swift也是一门面向对象开发的语言
 面向对象的基础是类,类产生了对象
 在Swift中如何定义类呢?
 
 class是Swift中的关键字,用于定义类
 class 类名 : SuperClass {
 // 定义属性和方法
 }
 
 定义的类,可以没有父类.那么该类是rootClass
 通常情况下,定义类时.继承自NSObject(非OC的NSObject)
 
 二. 如何定义类的属性
 Swift中类的属性有多种
 存储属性:存储实例的常量和变量
 计算属性:通过某种方式计算出来的属性
 类属性:与整个类自身相关的属性
 */
/*
 计算属性
 计算属性并不存储实际的值，而是提供一个getter和一个可选的setter来间接获取和设置其它属性
 计算属性一般只提供getter方法
 如果只提供getter，而不提供setter，则该计算属性为只读属性,并且可以省略get{}
 下面是计算属性的写法
 averageScore是计算属性,通过chineseScore和mathScore计算而来的属性
 在setter方法中有一个newValue变量,是系统指定分配的
 */
/*
 类属性
 
 类属性是与类相关联的，而不是与类的实例相关联
 所有的类和实例都共有一份类属性.因此在某一处修改之后,该类属性就会被修改
 类属性的设置和修改,需要通过类来完成
 下面是类属性的写法
 类属性使用static来修饰
 courseCount是类属性,用来记录学生有多少门课程
 */

class Student : NSObject {
    // 定义属性
    // 存储属性
    var age : Int = 0
    var name : String?
    
    var chineseScore : Double = 0.0
    var mathScore : Double = 0.0
    
    //计算属性
    var averageScore : Double {
        get {
            return (chineseScore + mathScore)/2
        }
        
        // 没有意义,因为之后获取值时依然是计算得到的
        // newValue是系统分配的变量名,内部存储着新值
        set {
            self.averageScore = newValue
        }
    }
    
    // 类属性
    static var corseCount : Int = 0
    
}
// 创建学生对象
let stu = Student()
// 给属性赋值
stu.age = 10
stu.name = "why"
stu.chineseScore = 89.0
stu.mathScore = 98.0
// 获取计算属性的值
print(stu.averageScore)

// 设置属性的值
Student.corseCount = 3
// 取出类属性的值
print(Student.corseCount)

/*
 监听属性的改变
 我们通过设置以下观察方法来定义观察者
 willSet：在属性值被存储之前设置。此时新属性值作为一个常量参数被传入。该参数名默认为newValue，我们可以自己定义该参数名
 didSet：在新属性值被存储后立即调用。与willSet相同，此时传入的是属性的旧值，默认参数名为oldValue
 willSet与didSet只有在属性第一次被设置时才会调用，在初始化时，不会去调用这些监听方法
 */
/*
class Person : NSObject {
    var name : String? {
        // 可以给newValue自定义名称
        willSet { // 属性即将改变,还未改变时会调用的方法
           print("111")
           print(newValue ?? "hh")
        }
        didSet {

        }
    }
    var age : Int = 0
    var height : Double = 0.0

}
let p : Person = Person()
// 在赋值时,监听该属性的改变
p.name = "why"
*/


class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue  {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}

let step = StepCounter()
step.totalSteps = 100
step.totalSteps = 360

/*
 类的构造函数
 构造函数类似于OC中的初始化方法:init方法
 默认情况下载创建一个类时,必然会调用一个构造函数
 即便是没有编写任何构造函数，编译器也会提供一个默认的构造函数。
 如果是继承自NSObject,可以对父类的构造函数进行重写
 */
/*
 构造函数的基本使用
 
 类的属性必须有值
 如果不是在定义时初始化值,可以在构造函数中赋值
 */
class Dog: NSObject {
    var  name: String
    var age: Int
    
    // 重写了NSObject(父类)的构造方法
    override init() {
        name = ""
        age = 0
    }
}
// 创建一个Dog对象
let dog = Dog()

/*
 很多时候,我们在创建一个对象时就会给属性赋值
 可以自定义构造函数
 注意:如果自定义了构造函数,会覆盖init()方法.即不在有默认的构造函数
 */
class Dog1: NSObject {
    var name: String
    var age: Int
    // 自定义构造函数,会覆盖init()函数
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}
let dog1 = Dog1(name: "why", age: 18)

/*
 字典转模型(初始化时传入字典)
 去字典中取出的是NSObject,任意类型.
 可以通过as!转成需要的类型,再赋值(不可以直接赋值)
 */
class Person: NSObject {
    var name: String
    var age: Int
    //自定义构造函数,会覆盖init()函数
    init(dict: [String : Any]) {
        name = dict["name"] as! String
        age = dict["age"] as! Int
    }
}
let dict6 = ["name" : "why", "age" : 18] as [String : Any];
let p = Person(dict: dict6)
p.age
p.name

/*
 字典转模型(利用KVC转化)
 
 利用KVC字典转模型会更加方便
 注意:
 KVC并不能保证会给所有的属性赋值
 因此属性需要有默认值
 基本数据类型默认值设置为0
 对象或者结构体类型定义为可选类型即可(可选类型没有赋值前为nil)
 */
class Person2: NSObject {
    // 结构体或者类的类型,必须是可选类型.因为不能保证一定会赋值
    var name : String?
    
    // 基本数据类型不能是可选类型,否则KVC无法转化
    var age : Int = 0
    
    // 自定义构造函数,会覆盖init()函数
    init(dict : [String : Any]) {
        // 必须先初始化对象
        super.init()
        
        // 调用对象的KVC方法字典转模型
        setValuesForKeys(dict)
    }
}

// 创建一个Person对象
let dict7 = ["name" : "why", "age" : 18] as [String : Any]
let p2 = Person2(dict: dict7)
p2.age
p2.name

//swift中 “Identical to”‘===’ 和 “Equal to”‘==’是不同的

//: [Next](@next)
