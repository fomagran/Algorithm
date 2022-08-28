import Foundation

func solution(_ n:Int, _ paths:[[Int]], _ gates:[Int], _ summits:[Int]) -> [Int] {
    var answer: [Int] = [-1,Int.max]
    var connection: [Int:[[Int]]] = [:]
    var summitDic: [Int:Bool] = [:]
    var gateDic: [Int:Bool] = [:]
                                  
    for path in paths {
        connection[path[0],default:[]].append([path[1],path[2]])
        connection[path[1],default:[]].append([path[1],path[2]])
    }
    
    for summit in summits {
        summitDic[summit] = true
    }
    
    for gate in gates {
        gateDic[gate] = true
    }

    func dfs(_ gate: Int, _ current: Int,_ maxIntensity: Int,_ summit: Int, _ visit: [Int:[Int]]) {
        //출입구로 다시 돌아온 경우
        print(gate,current,maxIntensity,summit)
        if gate == current && maxIntensity != -1 && summit != -1 {
            answer = [summit,maxIntensity]
            return
        }
        //산봉우리가 두 번 나온 경우
        if summit != -1 && summitDic[current] != nil {
            return
        }
        
        //출입구가 두 번 나온 경우
        if gateDic[current] != nil && gate != current {
            return
        }
        
        //현재 가장 작은 intensity보다 크거나 같은 경우
        if maxIntensity >= answer[1] {
            return
        }

        for point in connection[current,default:[]] {
            //한번 간 곳 방지
           if !visit[current,default:[]].contains(point[0]) {
              var newVisit = visit
              newVisit[current,default:[]].append(point[0])
              let firstSummit: Int = summitDic[point[0]] != nil ? point[0] : summit
              dfs(gate,point[0],max(maxIntensity,point[1]),firstSummit,newVisit)
           }
        }
    }
    
    for gate in gates {
        dfs(gate,gate,-1,-1,[:])
    }
                                  
    return answer
}

print(solution(6, [[1, 2, 3], [2, 3, 5], [2, 4, 2], [2, 5, 4], [3, 4, 4], [4, 5, 3], [4, 6, 1], [5, 6, 1]], [1, 3], [5]))
