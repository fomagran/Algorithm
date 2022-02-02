import Foundation

let count = Double(readLine()!)!
let nums = String(readLine()!).split(separator: " ").map{Int($0)!}

var negativeCount:Double = 0
var positiveCount:Double = 0

for n in nums {
    if n < 0 {
        negativeCount += 1
    }else if n > 0{
        positiveCount += 1
    }
}

let pos = positiveCount/count
print(String(format: "%.6f", pos))
let neg = negativeCount/count
print(String(format: "%.6f", neg))
let zero = (count - (negativeCount+positiveCount))/count
print(String(format: "%.6f", zero))



