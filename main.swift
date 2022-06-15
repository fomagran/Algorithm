func findTargetSumWays(_ nums: [Int], _ target: Int) -> Int {
    let sum:Int = nums.reduce(0,+)
    var dic:[Int:Int] = [:]
    
    for i in 0..<nums.count {
        for (key,value) in dic {
            let new = key + nums[i]*2
            if dic[new] == nil {
                dic[new] = value
            }else {
                dic[new]! += value
            }
        }
        
        if dic[sum-nums[i]*2] == nil {
            dic[sum-nums[i]*2] = 1
        }else {
            dic[sum-nums[i]*2]! += 1
        }
        print(dic)
    }
    
    if dic[sum] == nil {
        dic[sum] = 1
    }else {
        dic[sum]! += 1
    }
    
    return dic[target] ?? 0
}
print(findTargetSumWays([1,2,1],0))
//print(findTargetSumWays([0,0,0,0,1], 1))
//print(findTargetSumWays([1], 1))
