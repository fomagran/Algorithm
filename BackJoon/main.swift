//
//  main.swift
//  BackJoon
//
//  Created by Fomagran on 2022/01/19.
//

import Foundation

var maxCount = -1
var pc:[Int:[Int]] = [:]

func solution(_ info:[Int], _ edges:[[Int]]) -> Int {
    connectEdge(edges)
    dfs((1, 0), pc[0]!, info)
    return maxCount
}

func connectEdge(_ edges:[[Int]]) {
    for edge in edges {
        if pc[edge[0]] == nil {
            pc[edge[0]] = [edge[1]]
        }else {
            pc[edge[0]]!.append(edge[1])
        }
    }
}

func dfs(_ count:(Int,Int),_ visitableNodes:[Int],_ info:[Int]) {
    maxCount = max(count.0,maxCount)
    for node in visitableNodes {
        var newVisitableNodes = visitableNodes
        var newCount = count
        let index = newVisitableNodes.firstIndex(of:node)!
        newVisitableNodes.remove(at: index)
        newVisitableNodes.append(contentsOf:pc[node] ?? [])
        newCount = info[node] == 0 ? (count.0+1,count.1) : (count.0,count.1+1)
        if newCount.0 > newCount.1 {
            dfs(newCount, newVisitableNodes, info)
        }
    }
}

print(solution([0,0,1,1,1,0,1,0,1,0,1,1], [[0,1],[1,2],[1,4],[0,8],[8,7],[9,10],[9,11],[4,3],[6,5],[4,6],[8,9]]))
