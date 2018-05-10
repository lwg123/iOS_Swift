//: [Previous](@previous)

import Foundation

// 排序函数
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}
var reversedNames = names.sorted(by: backward)

// 闭包的表达式语法
/*
{ (parameters) -> return type in
    statements
}
 */
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})

// 从上下文推断类型
reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 } )
// 单表达式可以省略return
reversedNames = names.sorted(by: { s1, s2 in s1 > s2 } )
// 速记参数，可以省略in 
// $0 and $1 refer to the closure’s first and second String arguments.
reversedNames = names.sorted(by: { $0 > $1 } )
// Operator Methods
reversedNames = names.sorted(by: >)

// 尾随闭包
/*
 尾随闭包是一个书写在函数括号之后的闭包表达式，函数支持将其作为最后一个参数调用
 */
func someFunctionThatTakesAClosure(closure: () -> Void) {
    // function body goes here
}

someFunctionThatTakesAClosure() {
    // trailing closure's body goes here
}

// 例子
func calculate(opr: String, funN:(Int, Int) -> Int) {
    //最后一个参数funN是(Int,Int)-> Int函数类型，funN可以接收闭包表达式
    
    switch (opr) {
    case "+" :
        print("10 + 5 = \(funN(10,5))")
    default:
        print("10 - 5 = \(funN(10,5))")
    }
}

calculate(opr: "+", funN: {(a: Int, b: Int) -> Int in return a + b }) //调用
calculate(opr: "-"){(a: Int, b: Int) -> Int in return a + b } //调用，这种形式就是尾随闭包
calculate(opr: "+") { $0 + $1 } //调用，这种形式就是尾随闭包

//闭包的完整定义
/*
    {
        (arguments) ->returnType  in
        
        code 
        
    }(arguments)
 可以在闭包中定义参数，返回值。 闭包后用括号执行，并在括号中可以传参
 可以定义set，get，willSet，didiSet等方法
 */

var str={
    
    (arg1:String,arg2:String)->String in
    
    return arg1 + " " + arg2;
    
}("Job","Deer")
print(str)

var str1:String{
    
    return "JobDeer"
    
}

var str2:String{

  get {
      return "JobDeer"
  }

  set {
    
  }
}

//Escaping Closures
var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}

// Autoclosures
var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
func serve(customer customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: { customersInLine.remove(at: 0) } )





//: [Next](@next)
