import Foundation

var maxScore:Int = -1
var maxHistory:[[Int]] = []

func solution(_ n:Int, _ info:[Int]) -> [Int] {
    let history = Array(repeating: 0, count: 11)
    dfs(leftArrow: n, depth: 10, history: history, info: info)
    if maxScore <= 0 {
        return [-1]
    }
    return sortByMoreLowerScore()
}

func sortByMoreLowerScore() -> [Int]{
    var answer:[Int] = maxHistory.first!
    var max = 0
    for history in maxHistory {
        let numCount = history.filter{$0 != 0 }.count
        if max < numCount {
            answer = history
            max = numCount
        }
    }
    return answer.reversed()
}

func dfs(leftArrow:Int,depth:Int,history:[Int],info:[Int]) {
    var newHistory = history
    var newLeftArrow = leftArrow
    
    if depth == 0 || leftArrow <= 0 {
        newHistory[0] = depth == 0 ? leftArrow : newHistory[0]
        let score = getScoreGap(history,info)
        if maxScore == score {
            maxHistory.append(newHistory)
        }else if maxScore < score {
            maxScore = score
            maxHistory = [newHistory]
        }
        return
    }
    
    if leftArrow > info[10-depth] {
        newLeftArrow -= info[10-depth]+1
        newHistory[depth] = info[10-depth]+1
        dfs(leftArrow: newLeftArrow, depth: depth-1, history: newHistory, info: info)
        newHistory[depth] = 0
    }
    
    dfs(leftArrow: leftArrow, depth: depth-1, history: newHistory, info: info)
}

func getScoreGap(_ history:[Int],_ info:[Int]) -> Int {
    var ryan = 0
    var apeach = 0
    for (i,s) in history.enumerated() {
           if s == 0 {
               if info[10-i] != 0 {
                   apeach += i
               }
           }else {
               ryan += i
           }
       }
    return ryan - apeach
}

solution(10,[0,0,0,0,0,0,0,0,3,4,3])

