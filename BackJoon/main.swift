import Foundation

struct Location {
    var x:Int,y:Int
}

struct GameResult {
    var count:Int,isWinnerA:Bool
}

func solution(_ board:[[Int]], _ aloc:[Int], _ bloc:[Int]) -> Int {
    let b = wrapBoardEdges(board)
    let aLoc = Location(x: aloc[0]+1, y: aloc[1]+1)
    let bLoc = Location(x: bloc[0]+1, y: bloc[1]+1)
    let result = move(b, 0, aLoc, bLoc)
    return result.count
}

func wrapBoardEdges(_ board:[[Int]]) -> [[Int]] {
    var b = board
    for i in 0..<board.count {
        b[i].insert(0, at: 0)
        b[i].append(0)
    }
    b.insert(Array(repeating: 0, count: board[0].count+2), at: 0)
    b.append(Array(repeating: 0, count: board[0].count+2))
    return b
}

func move(_ board:[[Int]], _ count:Int,_ aLoc:Location,_ bLoc:Location) -> GameResult {
    let isTurnA = count%2 == 0 ? true : false
    let loc = isTurnA ? aLoc : bLoc
    var minCount = Int.max
    var maxCount = 0
    
    if board[loc.x][loc.y] == 0 {
        return GameResult(count: count, isWinnerA: isTurnA)
    }
        
    for l in makeLRUD(loc).filter({board[$0.x][$0.y] != 0}) {
        var newBoard = board
        newBoard[loc.x][loc.y] = 0
        let moved = isTurnA ? move(newBoard,count+1,l,bLoc) : move(newBoard,count+1,aLoc,l)
        let result = isTurnA ? moved.isWinnerA :!moved.isWinnerA
        if result {
            maxCount = max(maxCount,moved.count)
        }else {
            minCount = min(minCount,moved.count)
        }
    }
    
    if minCount == Int.max && maxCount == 0 {
        return GameResult(count: count, isWinnerA: isTurnA)
    }
    
    if minCount != Int.max {
        return GameResult(count: minCount, isWinnerA: !isTurnA)
    }
    
    return GameResult(count: maxCount, isWinnerA: isTurnA)
}

func makeLRUD(_ loc:Location) -> [Location] {
    return [Location(x: loc.x-1, y: loc.y),Location(x: loc.x+1, y: loc.y),Location(x: loc.x, y: loc.y-1),Location(x: loc.x, y: loc.y+1)]
}


print(solution([[1, 1, 1], [1, 1, 1], [1, 1, 1]], [1,0], [1,2]))
print(solution([[1, 1, 1], [1, 0, 1], [1, 1, 1]], [1,0], [1,2]))
print(solution([[1, 1, 1, 1, 1]], [0,0], [0,4]))
print(solution([[1]], [0,0], [0,0]))

