import Foundation

func solution(_ n:Int, _ m:Int, _ x:Int, _ y:Int, _ queries:[[Int]]) -> Int64 {
    var xCount:Int64 = 0
    var yCount:Int64 = 0
    let filterX:[[Int]] = queries.filter{$0[0] == 0 || $0[0] == 1}
    let filterY:[[Int]] = queries.filter{$0[0] == 2 || $0[0] == 3}

    for i in 0..<n {
        var location:(Int,Int) = (i,0)
        for q in filterY {
            let mv = move(query: q)
            location = (location.0+mv.0,location.1+mv.1)
            location.1 = max(0,location.1)
            location.1 = min(n-1,location.1)
        }
        if location.1 == x {
            yCount += 1
        }
    }
    
    for i in 0..<m {
        var location:(Int,Int) = (i,0)
        for q in filterX {
            let mv = move(query: q)
            location = (location.0+mv.0,location.1+mv.1)
            location.0 = max(0,location.0)
            location.0 = min(m-1,location.0)
        }
        if location.0 == y {
            xCount += 1
        }
    }

    return xCount*yCount
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
