func nextPermutation(_ nums: inout [Int]) {
    var lastLessIndex:Int = -1
    var lastBiggerIndex:Int = -1
    for i in 0..<nums.count-1 {
        if nums[i] < nums[i+1] {
            lastLessIndex = i
        }
    }
    if lastLessIndex < 0 {
        nums.reverse()
        return
    }
    
    for j in lastLessIndex+1..<nums.count {
        if nums[j] > nums[lastLessIndex] {
            lastBiggerIndex = j
        }
    }
    
    nums.swapAt(lastLessIndex, lastBiggerIndex)
    nums = nums[0...lastLessIndex] + nums[lastLessIndex+1..<nums.count].reversed()
}
