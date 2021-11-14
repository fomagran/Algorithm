import Foundation

func solution(_ n:Int, _ m:Int, _ x:Int, _ y:Int, _ queries:[[Int]]) -> Int64 {
    var gap = (0,0)
    queries.forEach {
        let q:(Int,Int) = move(query: $0)
        gap = (gap.0+q.0,gap.1+q.1)
    }

    var maxX:Int64 = 0
    var maxY:Int64 = 0
    
    if y == 0 || y == m-1{
        maxY = Int64(min(m-1,abs(gap.0))+1)
    }else {
        if m - 1 - y >= abs(gap.0) {
            maxY = 1
        }
    }
    
    if x == 0 || x == n-1 {
        maxX = Int64(min(n-1,abs(gap.1))+1)
    }else {
        if n - 1 - x >= abs(gap.1) {
            maxX = 1
        }
    }
    return maxX * maxY
}

func move(query:[Int]) -> (Int,Int) {
    switch query[0] {
    case 0:
        return (-query[1],0)
    case 1:
        return (query[1],0)
    case 2:
        return (0,-query[1])
    default:
        return (0,query[1])
    }
}

solution(2, 2, 0, 0, [[2,1],[0,1],[1,1],[0,1],[2,1]])
solution(2, 5, 0, 1, [[3,1],[2,2],[1,1],[2,3],[0,1],[2,1]])
