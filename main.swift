func maxSubArray(_ nums: [Int]) -> Int {
    var current:Int = Int.min
    var maxNum:Int = Int.min
    
    for n in nums {
        if current < 0 && current < n {
            current = n
        }else {
            current += n
        }
        maxNum = max(maxNum,current)
    }
    return maxNum
}

print(maxSubArray([1]))
