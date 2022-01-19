import Foundation

var maxCount = -1
var pc:[Int:[Int]] = [:]

func solution(_ info:[Int], _ edges:[[Int]]) -> Int {
    for edge in edges {
        if pc[edge[0]] == nil {
            pc[edge[0]] = [edge[1]]
        }else {
            pc[edge[0]]!.append(edge[1])
        }
    }
    dfs(1, 0, pc[0]!, info)
    return maxCount
}

func dfs(_ sheepCount:Int,_ wolfCount:Int,_ visitableNodes:[Int],_ info:[Int]) {
    var newSheepCount = sheepCount
    var newWolfCount = wolfCount
    print(wolfCount,sheepCount)
    if wolfCount == sheepCount {
        maxCount = max(maxCount,sheepCount)
        return
    }
    
    for node in visitableNodes {
        var newVisitableNodes = visitableNodes
        let index = newVisitableNodes.firstIndex(of:node)!
        newVisitableNodes.remove(at: index)
        newVisitableNodes.append(contentsOf:pc[info[node]] ?? [])
        if info[node] == 0 {
            newSheepCount += 1
        }else {
            newWolfCount += 1 
        }
        dfs(newSheepCount, newWolfCount, newVisitableNodes, info)
    }
}

solution([0,0,1,1,1,0,1,0,1,0,1,1], [[0,1],[1,2],[1,4],[0,8],[8,7],[9,10],[9,11],[4,3],[6,5],[4,6],[8,9]])
