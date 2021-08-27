import Foundation

var answer:Int = 0

func solution(_ n:Int) -> Int {
    if n == 1 { return 1 }
    let board = Array(repeating: Array(repeating: true, count: n), count: n)
        for (x,column) in board[0].enumerated() {
            if column {
                var history = Array(repeating: Array(repeating: true, count: n), count: n)
                history[0][x] = false
                findEnablePlace(n: n, depth: 1,history:history)
            }
        }
    return answer
}

func findEnablePlace(n:Int,depth:Int,history:[[Bool]]) {
    if depth == n-1 {
        for i in 0..<n {
            if isEnable(history: history, x: i, y: depth) {
                answer += 1
            }
        }
        return
    }
    
    for x in 0..<n {
        if isEnable(history: history, x: x, y:depth) {
            var newHistory = history
            newHistory[depth][x] = false
            findEnablePlace(n: n, depth: depth+1,history: newHistory)
        }
    }

}

func isEnable(history:[[Bool]],x:Int,y:Int) -> Bool {
    for i in 0..<history.count {
        if !history[i][x] {
            return false
        }
    }

    var newX1 = x
    var newX2 = x

    if y < history.count - 1 {
        for i in y+1..<history.count {
            if newX1 > 0 {
                newX1 -= 1
                if !history[i][newX1] {
                    return false
                }
            }

            if newX2 < history.count - 1 {
                newX2 += 1
                if !history[i][newX2] {
                    return false
                }
            }
        }
    }

    newX1 = x
    newX2 = x

    if y > 0 {
        for i in stride(from: y-1, through: 0, by: -1) {
            if newX1 > 0 {
                newX1 -= 1
                if !history[i][newX1] {
                    return false
                }
            }

            if newX2 < history.count-1 {
                newX2 += 1
                if !history[i][newX2] {
                    return false
                }
            }
        }
    }

    return true
}


solution(4)
