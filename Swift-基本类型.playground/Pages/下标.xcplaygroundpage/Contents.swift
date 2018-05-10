//: [Previous](@previous)

import Foundation

//subscript 定义格式，不能单独定义，
//subscript(index: Int) -> Int {
//    get {
//        // return an appropriate subscript value here
//    }
//    set(newValue) {
//        // perform a suitable setting action here
//    }
//}

struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}
let threeTimesTable = TimesTable(multiplier: 3)
print("six times three is \(threeTimesTable[6])")

// 下标的使用,通过下标添加或删除元素
var numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
numberOfLegs["bird"] = 2 // 添加元素
numberOfLegs["ant"] = nil // 删除元素
numberOfLegs

//subscript中的索引参数不一定永远是一个Int类型的index，它也可以有多个参数
struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}

var matrix = Matrix(rows: 2, columns: 2)
matrix[0,1] = 1.5
matrix[1,0] = 3.2
var some2 = matrix[1,0]
print("some:\(some2)")
matrix.grid

//获取数组中指定索引位置的子数组，我们可以在Array的扩展中用subscript来实现
// 比如我想取出 index 为0，2，3位置的元素
extension Array {
    subscript(input: [Int]) -> ArraySlice<Element> {
        get {
            var result = ArraySlice<Element>()
            for i in input {
                assert(i < self.count, "index out of range")
                result.append(self[i])
            }
            return result
        }
        set {
            // index表示数组input自己的索引，i表示数组self的索引
            for (index,i) in input.enumerated() {
                assert(i < self.count, "index out of range")
                self[i] = newValue[index]
            }
        }
    }
}
// 取出相应位置的值或者修改该位置的值
var arr = [1,2,3,4,5,6]
arr[[0,2,3]]
arr[[0,2,3]] = [-1,-3,-4]
arr




//: [Next](@next)
