import Foundation

var answer:Set<[[Bool]]> = []
var b:[[Bool]] = []

func solution(_ n:Int) -> Int {
    if n == 1 { return 1 }
    b = Array(repeating: Array(repeating: true, count: n), count: n)
    for (y,row) in b.enumerated() {
        for (x,column) in row.enumerated() {
            if column {
                let newBoard = makeVisitPlace(board: b, x: x, y: y)
                var history = Array(repeating: Array(repeating: true, count: n), count: n)
                history[y][x] = false
                findEnablePlace(n: n, depth: 1, board: newBoard,history:history)
            }
        }
    }
    return answer.count
}

func findEnablePlace(n:Int,depth:Int,board:[[Bool]],history:[[Bool]]) {
    if depth == n-1 {
        for (y,row) in board.enumerated() {
            for (x,column) in row.enumerated() {
                if column {
                    var newHistory = history
                    newHistory[y][x] = false
                    b = newHistory
                    answer.insert(newHistory)
                }
            }
        }
        return
    }
    for (y,row) in board.enumerated() {
        for (x,column) in row.enumerated() {
            if column {
                var newHistory = history
                newHistory[y][x] = false
                let newBoard = makeVisitPlace(board: board, x: x, y: y)
                findEnablePlace(n: n, depth: depth+1, board: newBoard,history: newHistory)
            }
        }
    }
}

func makeVisitPlace(board:[[Bool]],x:Int,y:Int) -> [[Bool]] {
    var newBoard = board
    
    newBoard[y] = Array(repeating:false, count:board.count)
    
    for i in 0..<board.count {
        newBoard[i][x] = false
    }
    
    var newX1 = x
    var newX2 = x
    
    if y < board.count - 1 {
        for i in y+1..<board.count {
            if newX1 > 0 {
                newX1 -= 1
                newBoard[i][newX1] = false
            }
            
            if newX2 < board.count - 1 {
                newX2 += 1
                newBoard[i][newX2] = false
            }
        }
    }
    
    newX1 = x
    newX2 = x
    
    if y > 0 {
        for i in stride(from: y-1, through: 0, by: -1) {
            if newX1 > 0 {
                newX1 -= 1
                newBoard[i][newX1] = false
            }
            
            if newX2 < board.count-1 {
                newX2 += 1
                newBoard[i][newX2] = false
            }
        }
    }
    return newBoard
}

solution(6)
