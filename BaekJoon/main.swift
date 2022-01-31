import Foundation

let count = Int(readLine()!)!
let nums = String(readLine()!).split(separator: " ").map{Int($0)!}

func aVeryBigSum(ar: [Int]) -> Int {
    return ar.reduce(0){$0+$1}
}

print(aVeryBigSum(ar: nums))

