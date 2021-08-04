func solution(_ gems:[String]) -> [Int] {
    var gemIndex:[String:[Int]] = [gems.first!:[0]]
    var firstIndex:Int = 0
    var lastIndex:Int = 0
    let allGems = Set(gems)
    var answer:[Int] = [0,100000]

    while true {
        if allGems.count == gemIndex.count {
            answer = (answer[1] - answer[0]) > lastIndex - firstIndex ? [firstIndex+1,lastIndex+1] : answer
            gemIndex[gems[firstIndex]]!.removeFirst()
            if gemIndex[gems[firstIndex]]!.isEmpty {
                gemIndex[gems[firstIndex]] = nil
            }
            firstIndex += 1
        }else {
            lastIndex += 1
            if lastIndex == gems.count { return answer }
            if gemIndex[gems[lastIndex]] == nil {
                gemIndex[gems[lastIndex]] = [lastIndex]
            }else {
                gemIndex[gems[lastIndex]]!.append(lastIndex)
            }
        }
    }
}

solution(["DIA", "RUBY", "RUBY", "DIA", "DIA", "EMERALD", "SAPPHIRE", "DIA"])
solution(["AA", "AB", "AC", "AA", "AC"])
solution(["XYZ", "XYZ", "XYZ"])
solution(["ZZZ", "YYY", "NNNN", "YYY", "BBB"])
