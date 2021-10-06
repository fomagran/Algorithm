import Foundation

/*
 연결된 전선망을 하나씩 끊어본다.
 좌측,우측 전선이 연결된 갯수를 센다.
 최솟값을 저장해두고 넘어간다면 세는 것을 그만둔다.
 */
var visited:[[Bool]] = []
func solution(_ n:Int, _ wires:[[Int]]) -> Int {
    visited = Array(repeating: Array(repeating: false, count: n+1), count:n+1)
    
    var minCount:Int = Int.max
    
    for wire in wires {
        visited[wire[0]][wire[1]] = true
        visited[wire[1]][wire[0]] = true
    }
    
    for wire in wires {
        var leftCount:Int = 0
        var rightCount:Int = 0
        dfs(start: wire[0],stop: wire[1], count: &leftCount)
        dfs(start: wire[1],stop: wire[0] ,count: &rightCount)
        minCount = min(minCount,abs(leftCount-rightCount))
    }
    
    return -1
}

func dfs(start:Int,stop:Int,count:inout Int) {
   let filter = visited[start].enumerated().filter{$0.element}.map{$0.offset}
    
    print(filter)
    
    count += filter.count
    
    for f in filter {
        if f == stop {
            continue
        }
        dfs(start: f, stop: stop, count: &count)
    }
}

solution(9, [[1,3],[2,3],[3,4],[4,5],[4,6],[4,7],[7,8],[7,9]])
