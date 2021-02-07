import Foundation

var answer = [Int]()

func solution(_ n:Int, _ costs:[[Int]]) -> Int {
    let numbers = (0..<n).map{$0}

    numbers.forEach{
        greedy($0, remain: [[0,1,1],[0,2,2],[1,2,5],[1,3,1],[2,3,8]], cost: 0,numbers: numbers)
    }
    
    print(answer)

    return answer.sorted().first ?? 0
}

func greedy(_ start:Int,remain:[[Int]],cost:Int,numbers:[Int]){
    
    var currentNumbers = numbers
    
    let startFilter = remain.filter{$0[0] == start || $0[1] == start}

    if  startFilter.isEmpty {
        return
    }
            
    let sort = startFilter.sorted{$0[2] < $1[2]}

    var min = Int()
    for (i,s) in sort.enumerated() {
        if s[0] == start {
            if currentNumbers[s[1]] != 101{
                min = sort[i][2]
                break
            }
        }else {
            if currentNumbers[s[0]] != 101{
            min = sort[i][2]
            break
        }
        }
    }
    
    let currentCost = cost + min
    
    currentNumbers[start] = 101
    
    if currentNumbers.filter({$0  != 101}).count == 1 {
        answer.append(currentCost)
        return
    }
    
    let startsFilter = startFilter.filter { $0[2] == min }
    
    var starts = [Int]()
    
    for s in startsFilter {
        if s[0] == start {
            starts.append(s[1])
        }else{
            starts.append(s[0])
        }
    }
    
    let currentRemain = remain.filter{ $0 != sort.first }
    
    starts.forEach { greedy($0, remain: currentRemain, cost: currentCost,numbers: currentNumbers) }
}

solution(4, [[0,1,1],[0,2,2],[1,2,5],[1,3,1],[2,3,8]])




