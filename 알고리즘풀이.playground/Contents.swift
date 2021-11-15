struct Range {
    var startX:Int,endX:Int,startY:Int,endY:Int,M:Int,N:Int
    var getArea:Int {
        return (endX-startX+1)*(endY-startY+1)
    }
}

var range:Range!

func solution(_ n:Int, _ m:Int, _ x:Int, _ y:Int, _ queries:[[Int]]) -> Int64 {
    range = Range(startX: y, endX: y, startY: x, endY: x,M: m-1,N:n-1)
    for query in queries.reversed() {
        if !isEdge(query: query) {
            if !checkRightQuery(query: query) { return 0 }
            moveStart(query: query)
        }
        extendEnd(query: query)
    }
    return Int64(range.getArea)
}

func isEdge(query:[Int]) -> Bool {
    return (query[0] == 0 && range.startX == 0) || (query[0] == 1 && range.endX == range.M) || (query[0] == 2 && range.startY == 0) || (query[0] == 3 && range.endY == range.N)
}

func extendEnd(query:[Int]) {
    switch query[0] {
    case 0:
        range.endX = min(range.M,range.endX+query[1])
    case 1:
        range.startX = max(0,range.startX-query[1])
    case 2:
        range.endY = min(range.N,range.endY+query[1])
    default:
        range.startY = max(0,range.startY-query[1])
    }
}

func moveStart(query:[Int]){
    switch query[0] {
    case 0:
        range.startX = min(range.M,range.startX+query[1])
    case 1:
        range.endX =  max(0,range.endX-query[1])
    case 2:
        range.startY = min(range.N,range.startY+query[1])
    default:
        range.endY = max(0,range.endY-query[1])
    }
}

func checkRightQuery(query:[Int]) -> Bool {
    switch query[0] {
    case 0:
        if range.startX+query[1] > range.M { return false }
    case 1:
        if range.endX-query[1] < 0 { return false }
    case 2:
        if range.startY+query[1] > range.N { return false }
    default:
        if range.endY-query[1] < 0 { return false }
    }
    return true
}

solution(2, 2, 0, 0, [[2,1],[0,1],[1,1],[0,1],[2,1]])
solution(2, 5, 0, 1, [[3,1],[2,2],[1,1],[2,3],[0,1],[2,1]])
solution(1000, 1000, 1, 1, [[0,100001],[2,100001]])
