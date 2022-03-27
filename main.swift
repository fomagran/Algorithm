import Foundation

struct Block {
    let position:CGPoint,number:Int,type:Int,isVertical:Bool
}

var numberTypes:[Int:[[[Int]]]] = [
    1:[[[0,0,1],[1,1,1]],[[1,0],[1,0],[1,1]],[[1,1,1],[1,0,0]],[[1,1],[0,1],[0,1]]],
    2:[[[1,0,0],[1,1,1]],[[1,1],[1,0],[1,0]],[[1,1,1],[0,0,1]],[[0,1],[0,1],[1,1]]],
    3:[[[1,1,1],[0,1,0]],[[1,0],[1,1],[1,0]],[[0,1,0],[1,1,1]],[[0,1],[1,1],[0,1]]]
]

var blocks:[Block] = []
var count:Int = 0

func solution(_ board:[[Int]]) -> Int {
    findBlocks(board,true)
    findBlocks(board,false)
    return countRemovableBlocks(board)
}

func countRemovableBlocks(_ board:[[Int]]) -> Int {
    var board = board
    let sorted = blocks.sorted {$0.position.y < $1.position.y}
    for block in sorted {
        checkAboveBlocks(block,&board)
    }
    return count
}

func checkAboveBlocks(_ block:Block,_ board:inout [[Int]]) {
    var xs:[Int] = []
    let x = Int(block.position.x)
    let y = Int(block.position.y)
    var remove:[(Int,Int)] = []
    if block.number == 1 && block.type == 2{
        xs = [x+1,x+2]
        remove = [(x,y),(x+1,y),(x+2,y),(x,y-1)]
    }else if block.number == 1 && block.type == 3 {
        xs = [x]
        remove = [(x,y),(x+1,y),(x+1,y-1),(x+1,y-2)]
    }else if block.number == 2 && block.type == 1 {
        xs = [x+1]
        remove = [(x,y),(x+1,y),(x,y-1),(x,y-2)]
    }else if block.number == 2 && block.type == 2 {
        xs = [x,x+1]
        remove = [(x,y),(x+1,y),(x+2,y),(x+2,y-1)]
    }else if block.number == 3 && block.type == 0 {
        xs = [x,x+2]
        remove = [(x,y),(x+1,y),(x+2,y),(x+1,y-1)]
    }else {
        return
    }
    for x in xs {
        for y in 0...y-1 {
            if board[y][Int(x)] != 0 {
                return
            }
        }
    }
    for r in remove {
        board[r.1][r.0] = 0
    }
    count += 1
}

func findBlocks(_ board:[[Int]],_ isVertical:Bool) {
    let row = isVertical ? 3 : 2
    let col = isVertical ? 2 : 3
    
    for i in 0...board.count-row {
        for j in 0...board.count-col {
            var block:[[Int]] = Array(repeating: [], count: row)
            for k in 0..<row {
                block[row-1-k] = Array(board[i+k][j...j+col-1])
            }
            let change = isExistEqual4Number(block)
            if let change = change {
                let equal = checkEqualBlock(change, isVertical: isVertical, position: CGPoint(x: j, y:i+row-1))
                if let equal = equal {
                    blocks.append(equal)
                }
            }
        }
    }
}

func isExistEqual4Number(_ block:[[Int]]) -> [[Int]]? {
    var numberCount:[Int:Int] = [:]
    var changeBlock:[[Int]] = []
    for b in block {
        for n in b {
            if numberCount[n] == nil && n != 0 {
                numberCount[n] = 1
            }else {
                numberCount[n]! += 1
            }
        }
    }
    
    for (n,c) in numberCount {
        if c == 4 {
            for (i,b) in block.enumerated() {
                changeBlock.append([])
                for e in b {
                    let oneOrZero = e == n ? 1 : 0
                    changeBlock[i].append(oneOrZero)
                }
            }
            return changeBlock
        }
    }
    return nil
}


func checkEqualBlock(_ block:[[Int]],isVertical:Bool,position:CGPoint) -> Block? {
    let type = isVertical ? [1,3] : [0,2]
    for i in 1...3 {
        for t in type {
            if numberTypes[i]![t] == block {
                return Block(position: position, number: i, type: t, isVertical:isVertical)
            }
        }
    }
    return nil
}

print(solution([[0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,4,0,0,0],[0,0,0,0,0,4,4,0,0,0],[0,0,0,0,3,0,4,0,0,0],[0,0,0,2,3,0,0,0,5,5],[1,2,2,2,3,3,0,0,0,5],[1,1,1,0,0,0,0,0,0,5]]))

//print(solution([[0,0,0,0,0,0,0,0,0,0]
//                 ,[0,0,0,0,0,0,0,0,0,0]
//                 ,[0,0,0,0,0,0,0,0,0,0]
//                 ,[0,0,0,0,0,0,0,0,0,0]
//                 ,[0,0,0,2,2,0,0,0,0,0]
//                 ,[0,0,0,2,1,0,0,0,0,0]
//                 ,[0,0,0,2,1,0,0,0,0,0]
//                 ,[0,0,0,0,1,1,0,0,0,0]
//                 ,[0,0,0,0,0,0,0,0,0,0]
//                 ,[0,0,0,0,0,0,0,0,0,0]]))

//print(solution([[0, 0, 0, 0, 0], [1, 0, 0, 2, 0], [1, 2, 2, 2, 0], [1, 1, 0, 0, 0], [0, 0, 0, 0, 0]]))

//print(solution([[0, 0, 1, 1, 1], [0, 0, 0, 1, 0], [3, 0, 0, 2, 0], [3, 2, 2, 2, 0], [3, 3, 0, 0, 0]]))
