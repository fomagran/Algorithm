func rob(_ nums: [Int]) -> Int {
    if nums.count <= 2 {
        return nums.max()!
    }

    var dp: [Int] = [nums[0],max(nums[0],nums[1])]

    for i in 2..<nums.count {
        let current: Int = nums[i]
        dp.append(max(dp[i-1],dp[i-2] + current))
    }

    return dp.last!
}

print(rob([2,1,1,2]))
