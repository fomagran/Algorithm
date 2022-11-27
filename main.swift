func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
    var sorted = candidates.sorted()
    var answer = [[Int]]()
    
    func combination(_ start: Int,_ sum: Int, _ picked: [Int]) {
        let sum = picked.reduce(0,{$0 + $1})
        
        if sum > target {
            return
        }
        
        if sum == target  {
            answer.append(picked)
            return
        }
        
        for i in start..<candidates.count {
            if sorted[i] > target { return }
            if i > start, sorted[i] == sorted[i-1] { continue }
            combination(i+1, sum + sorted[i], picked + [sorted[i]])
        }
    }
    
    combination(0, 0, [])
    
    return answer
}

print(combinationSum2([2,5,2,1,2], 5))
