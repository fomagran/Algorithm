//import Foundation
//
//var answer:Set<[[Bool]]> = []
//
//func solution(_ n:Int) -> Int {
//    if n == 1 {
//        return 1
//    }
//
//    let b = Array(repeating: Array(repeating: true, count: n), count: n)
//    for (y,row) in b.enumerated() {
//        for (x,column) in row.enumerated() {
//            if column {
//                var history = Array(repeating: Array(repeating: true, count: n), count: n)
//                history[y][x] = false
//                findEnablePlace(n: n, depth: 1,history:history)
//            }
//        }
//    }
//    return answer.count
//}
//
//func findEnablePlace(n:Int,depth:Int,history:[[Bool]]) {
//    if depth == n-1 {
//        for (x,bool) in history[n-1].enumerated() {
//            if bool {
//                var newHistory = history
//                newHistory[n-1][x] = false
//                answer.insert(newHistory)
//            }
//        }
//        return
//    }
//
//    for y in depth..<n {
//        for x in 0..<n {
//            if isEnable(history: history, x: x, y: y) {
//                var newHistory = history
//                newHistory[y][x] = false
//                findEnablePlace(n: n, depth: depth+1,history: newHistory)
//            }
//        }
//    }
//}
//
//func isEnable(history:[[Bool]],x:Int,y:Int) -> Bool {
//    for i in 0..<history.count {
//        if !history[i][x] {
//            return false
//        }
//    }
//
//    var newX1 = x
//    var newX2 = x
//
//    if y < history.count - 1 {
//        for i in y+1..<history.count {
//            if newX1 > 0 {
//                newX1 -= 1
//                if !history[i][newX1] {
//                    return false
//                }
//            }
//
//            if newX2 < history.count - 1 {
//                newX2 += 1
//                if !history[i][newX2] {
//                    return false
//                }
//            }
//        }
//    }
//
//    newX1 = x
//    newX2 = x
//
//    if y > 0 {
//        for i in stride(from: y-1, through: 0, by: -1) {
//            if newX1 > 0 {
//                newX1 -= 1
//                if !history[i][newX1] {
//                    return false
//                }
//            }
//
//            if newX2 < history.count-1 {
//                newX2 += 1
//                if !history[i][newX2] {
//                    return false
//                }
//            }
//        }
//    }
//
//    return true
//}

import Foundation

var answer:Set<[[Bool]]> = []

func solution(_ n:Int) -> Int {
    if n == 1 { return 1 }
    let board = Array(repeating: Array(repeating: true, count: n), count: n)
        for (x,column) in board[0].enumerated() {
            if column {
                let newBoard = makeVisitPlace(board: board, x: x, y: 0)
                var history = Array(repeating: Array(repeating: true, count: n), count: n)
                history[0][x] = false
                findEnablePlace(n: n, depth: 1, board: newBoard,history:history)
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

solution(4)
