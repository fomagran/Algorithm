func rob(_ nums: [Int]) -> Int {
    var dp: [Int] = [0,0]

    for (i,num) in nums.enumerated() {
        dp.append(max(dp[i+1],dp[i] + num))
    }

    return dp.last!
}

print(rob([2,1,1,2,1,1,2]))
