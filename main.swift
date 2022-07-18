func numTrees(_ n: Int) -> Int {
    
    if n == 1 {
        return 1
    }
    
    var dp: [Int] = [1,1]
    
    for i in 2...n {
        var total: Int = 0
        
        for j in 0..<i {
            let left: Int = dp[j]
            let right: Int = dp[i-j-1]
            total += left * right
        }
        
        dp.append(total)
    }
    
    return dp[n]
}

print(numTrees(3))


//1 2 5 12 25 52





