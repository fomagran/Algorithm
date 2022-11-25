func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
    let sorted = candidates.sorted { $0 < $1 }
    var answer = Set<[Int]>()
    
    func dfs(_ depth: Int, _ combination: [Int]) {
        let sum = combination.reduce(0, { $0 + $1 })
        
        if depth == candidates.count {
            return
        }
        
        if sum > target {
            return
        }
        
        if sum == target {
            answer.insert(combination)
        }
        
        for i in depth+1..<candidates.count {
            var new = combination
            new.append(sorted[i])
            dfs(i,new)
        }
    }
    
    for i in 0..<candidates.count {
        dfs(i,[sorted[i]])
    }
    
    return Array(answer)
}




print(combinationSum2([10,1,2,7,6,1,5], 8))
