func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
    var answer:[[Int]] = []
    let sorted = candidates.sorted()
    
    func dfs(_ depth:Int,_ current:[Int],_ sum:Int) {
        if sum == target {
            answer.append(current)
            return
        }
        
        if sum > target {
            return
        }
        
        for i in depth..<sorted.count {
            dfs(i,current+[sorted[i]], sum + sorted[i])
        }
    }
    
    dfs(0,[], 0)
    
    return answer
}

print(combinationSum([2], 1))
