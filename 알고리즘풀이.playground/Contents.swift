import Foundation

var boardCopy:[[Int]] = []
var emptyBlocks:[[(Int,Int)]] = []
var blocks:[[(Int,Int)]] = []
var answer:Int = 0

func solution(_ game_board:[[Int]], _ table:[[Int]]) -> Int {
    boardCopy = game_board
    findBlocks(isEmpty:true)
    boardCopy = table.map{$0.map{abs($0-1)}}
    findBlocks(isEmpty:false)
    checkEqualBlock()
    return answer
}

func findBlocks(isEmpty:Bool) {
    var check:Bool = true
    while check {
        check = false
        outer:for (y,board) in boardCopy.enumerated() {
            for (x,n) in board.enumerated() {
                if n == 0 {
                    if isEmpty {
                        emptyBlocks.append([(x,y)])
                    }else {
                        blocks.append([(x,y)])
                    }
                    boardCopy[y][x] = 1
                    checkAllDirection(x: x, y: y,isEmpty: isEmpty)
                    check = true
                    break outer
                }
            }
        }
    }
}

func checkAllDirection(x:Int,y:Int,isEmpty:Bool) {
    var queue:[(Int,Int)] = [(x,y)]
    while !queue.isEmpty {
        let first = queue.removeFirst()
        let left = (first.0-1,first.1)
        let right = (first.0+1,first.1)
        let up = (first.0,first.1-1)
        let down = (first.0,first.1+1)
        let new = [left,right,up,down]
        
        for d in new {
            if 0..<boardCopy.count ~= d.0 && 0..<boardCopy.count ~= d.1 {
                if boardCopy[d.1][d.0] == 0 {
                    boardCopy[d.1][d.0] = 1
                    if isEmpty {
                        emptyBlocks[emptyBlocks.count-1].append(d)
                    }else {
                        blocks[blocks.count-1].append(d)
                    }
                    queue.append(d)
                }
                
            }
        }
    }
}

func checkEqualBlock() {
    while !emptyBlocks.isEmpty {
        let empty = emptyBlocks.removeFirst()
        outer:for (i,block) in blocks.enumerated() {
            if block.count != empty.count { continue }
            let emptySort = sortBlock(block: empty)
            let rotateBlocks = rotateBlock(block: block)
            second:for rotateBlock in rotateBlocks {
                var rotateSort = sortBlock(block: rotateBlock)
                let x = emptySort.first!.0 - rotateSort.first!.0
                let y = emptySort.first!.1 - rotateSort.first!.1
                rotateSort = rotateSort.map{($0.0+x,$0.1+y)}
                for i in 0..<emptySort.count {
                    if emptySort[i] != rotateSort[i] {
                        continue second
                    }
                }
                    blocks.remove(at: i)
                    answer += empty.count
                    break outer
            }
        }
    }
}

func rotateBlock(block:[(Int,Int)]) -> [[(Int,Int)]] {
    var newBlock = block
    var rotateBlocks:[[(Int,Int)]] = []
    
    for _ in 0..<3 {
        var rotateBlock:[(Int,Int)] = []
        for b in newBlock {
            rotateBlock.append((b.1,-b.0))
        }
        newBlock = rotateBlock
        rotateBlocks.append(rotateBlock)
    }
    return rotateBlocks
}

func sortBlock(block:[(Int,Int)]) -> [(Int,Int)] {
    let sort:[(Int,Int)] = block.sorted{$0.0 == $1.0 ? $0.1 < $1.1 : $0.0 < $1.0 }
    return sort
}

solution([[0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0], [1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0], [0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 1, 0], [1, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0, 1], [0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0], [0, 0, 1, 1, 1, 0, 1, 0, 1, 1, 0, 1], [0, 1, 0, 0, 0, 1, 1, 0, 0, 0, 1, 0], [0, 0, 1, 0, 1, 0, 0, 1, 1, 1, 0, 0], [1, 1, 0, 0, 1, 0, 0, 1, 1, 1, 1, 0], [0, 0, 1, 1, 0, 1, 0, 1, 1, 1, 0, 0], [0, 0, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1], [0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0]], [[1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 1], [1, 1, 0, 0, 0, 0, 1, 1, 1, 0, 1, 1], [1, 0, 1, 0, 1, 0, 0, 0, 0, 1, 1, 0], [0, 0, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0], [1, 1, 0, 1, 0, 0, 0, 1, 1, 1, 0, 0], [1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0], [1, 0, 0, 1, 0, 1, 1, 1, 0, 0, 0, 1], [1, 1, 0, 1, 0, 1, 1, 1, 0, 0, 0, 1], [0, 0, 0, 1, 1, 0, 0, 0, 1, 1, 0, 1], [1, 1, 0, 1, 1, 0, 1, 0, 0, 1, 0, 1], [1, 1, 1, 0, 0, 0, 1, 0, 1, 1, 0, 1], [1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 0, 1]])
