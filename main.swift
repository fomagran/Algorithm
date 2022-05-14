func firstMissingPositive(_ nums: [Int]) -> Int {
    var dic:[Int:Bool] = [:]
    
    nums.forEach {
        dic[$0] = true
    }
    
    var current = 1
    while dic[current] != nil {
        current += 1
    }
    return current
}

print(firstMissingPositive([1,2,0]))
