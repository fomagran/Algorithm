func minDistance(_ word1: String, _ word2: String) -> Int {
    if word1.isEmpty || word2.isEmpty {
        return word1.isEmpty ? word2.count : word1.count
    }
    
    let word1Map:[String] = [""] + word1.map{String($0)}
    let word2Map:[String] = [""] + word2.map{String($0)}
    
    var dp:[[Int]] = Array(repeating:Array(repeating:0, count: word1Map.count),count:word2Map.count)
    
    dp[0] = (0..<word1Map.count).map{$0}
    
    for i in 0..<word2Map.count {
        dp[i][0] = i
    }
    
    for y in 1..<word2Map.count {
        for x in 1..<word1Map.count {
            if word2Map[y] == word1Map[x] {
                dp[y][x] = dp[y-1][x-1]
            }else {
                let min:Int = min(min(dp[y-1][x-1],dp[y-1][x]),dp[y][x-1])
                dp[y][x] = min + 1
            }
        }
    }
    
    for d in dp {
        print(d)
    }
    
    return dp.last?.last ?? 0
}

print(minDistance("a"
                  ,"b"))
