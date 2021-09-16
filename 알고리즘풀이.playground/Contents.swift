func solution(_ enter:[Int], _ leave:[Int]) -> [Int] {
    var enterCopy:[Int] = enter
    var answers:[[Int]] = Array(repeating: [Int](), count: enter.count)
    var lastIndex:Int = 0
    
    for n in leave {
        let index = enterCopy.firstIndex(of: n)!
        if index >= lastIndex {
            let nums = Array(enterCopy[0...index])
            for i in 0...index {
                answers[enterCopy[i]-1].append(contentsOf: nums)
            }
            lastIndex = index
        }
        lastIndex = lastIndex == 0 ? lastIndex : lastIndex-1
        enterCopy.remove(at: index)
    }
    return answers.map{Set($0).count-1}
}

solution([1,3,2], [1,2,3])
solution([1,4,2,3],[2,1,4,3])
