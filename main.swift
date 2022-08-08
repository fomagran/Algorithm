func rob(_ nums: [Int]) -> Int {
    if nums.count == 1 {
        return nums[0]
    }
    
    var nums = nums
    let last = nums.removeLast()
    
    func getMaxMoney() -> Int {
        var dp: [Int] = [0,0]
        for (i,num) in nums.enumerated() {
            dp.append(max(dp[i+1],dp[i] + num))
        }
        return dp.last!
    }
    
    let maxMoney1: Int = getMaxMoney()
    nums.removeFirst()
    nums.append(last)
    let maxMoney2: Int = getMaxMoney()

    return max(maxMoney1,maxMoney2)
}



print(rob([0,1]))
