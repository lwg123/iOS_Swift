//: [Previous](@previous)

//: arrarys,sets,dictionaries

import Foundation
//: 数组，存储同一类型的值，有序
// 数组创建
var someInts = [Int]()
someInts.append(3)
someInts = []
var threeDoubles = Array(repeating: 1.0, count: 3)
var anotherD = Array(repeating: 2.5, count: 3)
var sixDoubles = threeDoubles + anotherD
var shoppingList: [String] = ["Eggs", "Milk"]
var shoppingList1 = ["Eggs", "Milk"] // 推断类型
shoppingList.append("Flour")
shoppingList += ["Baking"]
// 使用下标语法取出某一个值，进行更改,还可以更改一个range范围的值
// 注意：不能通过下标语法添加新元素
var firstItem = shoppingList[0]
shoppingList[0] = "six eggs"
shoppingList[1...3] = ["Bananas", "Apples"]

//插入,删除
shoppingList.insert("Maple", at: 0)
shoppingList.remove(at: 0)
let apples = shoppingList.removeLast() //删除最后一个
for item in shoppingList {
    print(item)
}

for (index, value) in shoppingList.enumerated() {
    print("Item \(index + 1): \(value)")
}

// Sets，存放相同类型元素的集合，无序，元素不重复
var letters = Set<Character>()
letters.insert("a")
letters = []
var favoriteGenres1: Set<String> = ["Rock", "Classical", "Hip hop"]
var favoriteGenres: Set = ["Rock", "Classical", "Hip hop"]
favoriteGenres.insert("Jazz")
if let removedGenre = favoriteGenres.remove("Rock") {
    print("\(removedGenre)? I'm over it.")
}

if favoriteGenres.contains("Funk") {
    print("I get up on the good foot.")
} else {
    print("It's too funky in here.")
}

for genre in favoriteGenres {
    print("\(genre)")
}
/**
 intersection(_:) 包含两个集合的交集
 symmetricDifference(_:) 两个集合中的不相同的部分
 union(_:) 并集
 subtracting(_:) 在a中不在b中的元素
 */
let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]
oddDigits.union(evenDigits).sorted()
oddDigits.intersection(evenDigits).sorted()
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()

//: 字典
// 定义一个可变字典
var dict1 : [String : Any] = [String : Any]()
// 定义一个不可变字典
let dict2 = ["name" : "why", "age" : "18"]
//在声明一个Dictionary类型的时候可以使用下面的语句之一
//var dict1: Dictionary<Int, String>
//var dict2: [Int: String]
// 声明字典的同时,进行初始化
var dict : [String : Any] = ["name" : "why", "age" : 18]
// swift中任意对象,通常不使用NSObject,使用AnyObject
var dict3 : Dictionary<String, AnyObject>
//dict3 = ["name" : "why" as AnyObject, "age" : 18 as AnyObject]

//字典的基本操作
// 添加数据
dict["height"] = 1.88
dict["weight"] = 70.0
dict
// 删除字段
dict.removeValue(forKey: "height")
dict
// 修改字典
dict["name"] = "lmj"
dict
// 查询字典
dict["name"]

//字典的遍历
// 遍历字典中所有的值
for value in dict.values {
    print(value)
}
// 遍历字典中所有的键
for key in dict.keys {
    print(key)
}
// 遍历所有的键值对
for (key,value) in dict {
    print(key)
    print(value)
}
// 字典的合并
var dict4 : [NSString : Any] = ["name" : "yz", "age" : 20]
var dict5 : [NSString : Any] = ["height" : 1.87, "phoneNum" : "+86 110"]
// 字典不可以直接相加合并
for (key, value) in dict4 {
    dict5[key] = value
}





//: [Next](@next)
