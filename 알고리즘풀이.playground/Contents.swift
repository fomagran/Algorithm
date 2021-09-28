import Foundation

let numbers = [82,10,9,72,31,45,60]

func insertionSort(nums:[Int],startIndex:Int) -> [Int] {
    print(nums)
    if startIndex == nums.count {
        return nums
    }
    var x = startIndex-1
    var newNums = nums
    let current = newNums.remove(at: startIndex)
    
    while x >= 0 {
        if current >= nums[x] {
            newNums.insert(current, at: x+1)
            return insertionSort(nums:newNums,startIndex: startIndex+1)
        }
        x -= 1
    }
    
    newNums.insert(current, at: 0)
    return insertionSort(nums:newNums,startIndex: startIndex+1)
}

insertionSort(nums: numbers, startIndex: 1)
