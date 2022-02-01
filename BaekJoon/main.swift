import Foundation

let count = Int(readLine()!)!
var matrix:[[Int]] = []

for _ in 0..<count {
    let nums = String(readLine()!).split(separator: " ").map{Int($0)!}
    matrix.append(nums)
}

func diagonalDifference(arr: [[Int]]) -> Int {
    var d1 = 0
    var d2 = 0
    for i in 0..<arr.count {
        d1 += matrix[i][i]
        d2 += matrix[i][matrix.count-1-i]
    }
    return abs(d1-d2)
}

print(diagonalDifference(arr: matrix))


