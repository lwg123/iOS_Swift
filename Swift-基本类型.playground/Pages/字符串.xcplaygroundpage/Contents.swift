//: [Previous](@previous)

import Foundation

/*:字符串常量
 
 */
let someString = "Some string literal value"

//空字符串
var emptyString = ""               // empty string literal
var anotherEmptyString = String()  // initializer syntax
// these two strings are both empty, and are equivalent to each other
if emptyString == anotherEmptyString {
    print("相等")
}

// 判断字符串是否为空
if emptyString.isEmpty {
    print("Nothing to see here")
}
// 字符串的可变性
var variableString = "Horse"
variableString += " and carriage"

//let constantString = "Highlander"
//constantString += " and another Highlander" 错误 let为不可变类型


// 字符串查询
for character in "Dog!🐶".characters {
    print(character)
}
//字符类型转换为字符串类型
let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
let catString = String(catCharacters)
print(catString)


// 字符串的连接方法
// 使用 + 号
let string1 = "hello"
let string2 = " there"
var welcome1 = string1 + string2

var instruction = "look over"
instruction += string2
// append
let exclamationMark: Character = "!"
welcome1.append(exclamationMark)

// 拼接
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"


// Unicode 标量
let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"

let dollarSign = "\u{24}"        // $,  Unicode scalar U+0024
let blackHeart = "\u{2665}"      // ♥,  Unicode scalar U+2665
let sparklingHeart = "\u{1F496}" // 💖, Unicode scalar U+1F496
// 字符计算
let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print("unusualMenagerie has \(unusualMenagerie.characters.count) characters")


// 使用下标语法访问字符串索引中的字符
let greeting = "Guten Tag!"
greeting[greeting.startIndex]
// G
greeting[greeting.index(before: greeting.endIndex)]
// !
greeting[greeting.index(after: greeting.startIndex)]
// u
let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index]
// a


// 插入和删除
var welcome = "hello"
welcome.insert("!", at: welcome.endIndex)

welcome.insert(contentsOf:" there".characters, at: welcome.index(before: welcome.endIndex))

welcome.remove(at: welcome.index(before: welcome.endIndex))
// welcome now equals "hello there"

let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
welcome.removeSubrange(range)
// welcome now equals "hello"
var 😀 = "smile";
print("lalal" + 😀);

let x = 1, y = 2, z = 3, b = true;

print(x, y, z, b);
print(x, y, z , separator:",");
print(x, y, z , separator:",", terminator:" end\n");



//: [Next](@next)
