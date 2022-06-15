func findTargetSumWays(_ nums: [Int], _ target: Int) -> Int {
    let sum:Int = nums.reduce(0,+)
    var count:Int = 0
    if sum == target {
        count += 1
    }
    var sums:[Int] = []
    
    for i in 0..<nums.count {
        sums.append(nums[i])
        for (j,_) in sums.enumerated() {
            if sum - sums[j]*2 == target {
                count += 1
            }
            sums[j] += nums[i]
        }
    }
    
    return count
}

print(findTargetSumWays([1,1,1,1,1], 3))
