/*

 */

func subsets(_ nums: [Int]) -> [[Int]] {
    var answer:[[Int]] = []
    func dfs(current:[Int],index:Int) {
        answer.append(current)
        for i in index..<nums.count {
            dfs(current:current+[nums[i]],index:i+1)
        }
    }
    
    dfs(current: [], index: 0)
    return answer
}

print(subsets([1,2,3]))
