import Foundation

struct PointInfo {
    let gate: Int
    let current: Int
    let maxIntensity: Int
}

func solution(_ n:Int, _ paths:[[Int]], _ gates:[Int], _ summits:[Int]) -> [Int] {
    var answer: [Int] = [Int.max,Int.max]
    var connection: [Int:[[Int]]] = [:]
    var summitDic: [Int:Bool] = [:]
    var gateDic: [Int:Bool] = [:]
    var bfsQueue: [PointInfo] = []
    var intensities: [Int] = Array(repeating: Int.max, count: n+1)
    
    for summit in summits {
        summitDic[summit] = true
    }
    
    for gate in gates {
        gateDic[gate] = true
    }
    
    for path in paths {
        connection[path[0],default:[]].append([path[1],path[2]])
        connection[path[1],default:[]].append([path[0],path[2]])
    }

    func check(_ info: PointInfo) {
        if summitDic[info.current] != nil || info.maxIntensity > intensities[info.current] {
            return
        }
        
        for next in connection[info.current,default:[]] where gateDic[next[0]] == nil {
            let maxIntensity = max(info.maxIntensity,next[1])
            
            if maxIntensity < intensities[next[0]] {
                updateAnswer(next[0], maxIntensity)
                intensities[next[0]] = maxIntensity
                bfsQueue.append(PointInfo(gate: info.gate, current: next[0], maxIntensity:maxIntensity))
            }
        }
    }

    
    for gate in gates {
        bfsQueue.append(PointInfo(gate: gate, current: gate, maxIntensity: -1))
        while !bfsQueue.isEmpty {
            let first = bfsQueue.removeFirst()
            check(first)
        }
    }
    
    func updateAnswer(_ index: Int,_ maxIntensity: Int) {
        if summitDic[index] != nil {
            if maxIntensity == answer[1] {
                answer[0] = min(answer[0],index)
            } else if maxIntensity < answer[1] {
                answer = [index,maxIntensity]
            }
        }
    }
                                  
    return answer
}

print(solution(6, [[1, 2, 3], [2, 3, 5], [2, 4, 2], [2, 5, 4], [3, 4, 4], [4, 5, 3], [4, 6, 1], [5, 6, 1]], [1, 3], [5]))
print(solution(7, [[1, 4, 4], [1, 6, 1], [1, 7, 3], [2, 5, 2], [3, 7, 4], [5, 6, 6]], [1], [2,3,4]))
print(solution(7, [[1, 2, 5], [1, 4, 1], [2, 3, 1], [2, 6, 7], [4, 5, 1], [5, 6, 1], [6, 7, 1]], [3,7], [1,5]))
print(solution(5, [[1, 3, 10], [1, 4, 20], [2, 3, 4], [2, 4, 6], [3, 5, 20], [4, 5, 6]], [1, 2], [5]))

