func solution(_ alp:Int, _ cop:Int, _ problems:[[Int]]) -> Int {
    var maxAlp: Int = alp
    var maxCop: Int = cop
    
    problems.forEach {
        maxAlp = max(maxAlp,$0[0])
        maxCop = max(maxCop,$0[1])
    }
    
    var dp: [[Int]] = Array(repeating:Array(repeating:10000,count:maxCop+1),count:maxAlp+1)
    dp[alp][cop] = 0
    
    for currentAlp in alp...maxAlp {
        for currentCop in cop...maxCop {
            var minAlp = min(currentAlp+1,maxAlp)
            var minCop = min(currentCop+1,maxCop)
            dp[minAlp][currentCop] = min(dp[minAlp][currentCop],dp[currentAlp][currentCop] + 1)
            dp[currentAlp][minCop] = min(dp[currentAlp][minCop],dp[currentAlp][currentCop] + 1)
            
            problems.forEach { problem in
                if currentAlp >= problem[0] && currentCop >= problem[1] {
                    minAlp = min(maxAlp,currentAlp+problem[2])
                    minCop = min(maxCop,currentCop+problem[3])
                    dp[minAlp][minCop] = min(dp[minAlp][minCop],dp[currentAlp][currentCop] + problem[4])
                }
            }
        }
    }
    
    return dp[maxAlp][maxCop]
}


print(solution(10, 10, [[10,15,2,1,2],[20,20,3,3,4]]))
print(solution(0, 0, [[0,0,2,1,2],[4,5,3,1,2],[4,11,4,0,2],[10,4,0,4,2]]))
