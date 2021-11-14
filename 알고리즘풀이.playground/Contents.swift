import Foundation

struct Range {
    var startX:Int,endX:Int,startY:Int,endY:Int
    var getArea:Int {
        return (endX-startX+1)*(endY-startY+1)
    }
}

var M:Int!
var N:Int!
var range:Range!

func solution(_ n:Int, _ m:Int, _ x:Int, _ y:Int, _ queries:[[Int]]) -> Int64 {
    range = Range(startX: y, endX: y, startY: x, endY: x)
    M = m-1
    N = n-1
    queries.reversed().forEach {
        changeRange(query:$0, isEdge: isEdge(query: $0))
    }
    return isRightQuery(queries: queries, x: x, y: y) ? Int64(range.getArea) : 0
}

func isRightQuery(queries:[[Int]],x:Int,y:Int) -> Bool {
    var location:(Int,Int) = (range.endX,range.endY)
    for q in queries {
        let mv = move(query: q)
        location = (location.0+mv.0,location.1+mv.1)
        location.0 = max(0,location.0)
        location.1 = max(0,location.1)
        location.0 = min(M,location.0)
        location.1 = min(N,location.1)
    }
    return location == (y,x)
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

func isEdge(query:[Int]) -> Bool {
    return (query[0] == 0 && range.startX == 0) || (query[0] == 1 && range.endX == M) || (query[0] == 2 && range.startY == 0) || (query[0] == 3 && range.endY == N)
}

func changeRange(query:[Int],isEdge:Bool){
    switch query[0] {
    case 0:
        range.startX = isEdge ? range.startX : min(M,range.startX+query[1])
        range.endX = min(M,range.endX+query[1])
    case 1:
        range.startX = max(0,range.startX-query[1])
        range.endX = isEdge ? range.endX : max(0,range.endX-query[1])
    case 2:
        range.startY = isEdge ? range.startY : min(N,range.startY+query[1])
        range.endY = min(N,range.endY+query[1])
    default:
        range.startY = max(0,range.startY-query[1])
        range.endY = isEdge ? range.endY : max(0,range.endY-query[1])
    }
}

solution(2, 2, 0, 0, [[2,1],[0,1],[1,1],[0,1],[2,1]])
solution(2, 5, 0, 1, [[3,1],[2,2],[1,1],[2,3],[0,1],[2,1]])
solution(1000, 1000, 1, 1, [[0,100001],[2,100001]])
