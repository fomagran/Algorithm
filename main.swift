func subarraySum(_ nums: [Int], _ k: Int) -> Int {
    var dic:[Int:Int] = [0:1]
    var latestSum:Int = 0
    var answer:Int = 0
    
    for n in nums {
        latestSum += n
        answer += (dic[latestSum - k] ?? 0)
        dic[latestSum] = (dic[latestSum] ?? 0) + 1
    }
    
    return answer
}

print(subarraySum([-1,1,1,-1,1], 1))
print(subarraySum([1,2,3], 3))
print(subarraySum([100,1,2,3,4], 4))

