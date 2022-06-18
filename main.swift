func findTargetSumWays(_ nums: [Int], _ target: Int) -> Int {
    let sum:Int = nums.reduce(0,+)
    var dic:[Int:Int] = [0:1]
    
    for n in nums{
        for (key,value) in dic{
            dic[key+n*2] = (dic[key+n*2] ?? 0) + value
        }
    }
    
    return dic[sum-abs(target)] ?? 0
}





print(findTargetSumWays([1,2,3,1,2,3],6))
//print(findTargetSumWays([1,1,1,1,1],3))
//print(findTargetSumWays([0,0,0,0,1], 1))
//print(findTargetSumWays([1000], -1000))


