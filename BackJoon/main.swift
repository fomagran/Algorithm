import Foundation

struct Point {
    var x:Int,y:Int
}

func solution(_ board:[[Int]], _ skill:[[Int]]) -> Int {
    var zeroBoard = Array(repeating: Array(repeating:0, count: board[0].count+1), count:board.count+1)
    for s in skill {
        changeBoard(&zeroBoard, s)
    }
    addVertically(&zeroBoard)
    return addHorizontally(&zeroBoard,board)
}

func addHorizontally(_ board:inout [[Int]],_ original:[[Int]]) -> Int {
    var count = 0
    for i in 0..<board.count-1 {
        for j in 0..<board[0].count-1 {
            if j != 0 {
                board[i][j] += board[i][j-1]
            }
            if board[i][j] + original[i][j] > 0{
                count += 1
            }
        }
    }
    return count
}

func addVertically(_ board:inout [[Int]]) {
    for j in 0..<board[0].count-1 {
        for i in 1..<board.count-1 {
            board[i][j] += board[i-1][j]
        }
    }
}

func changeBoard(_ board:inout [[Int]],_ skill:[Int]){
    let isHeal = skill[0] == 2
    let start = Point(x: skill[2], y: skill[1])
    let end = Point(x: skill[4], y: skill[3])
    let degree = isHeal ? skill[5] : -skill[5]
    board[start.y][start.x] += degree
    board[end.y+1][end.x+1] += degree
    board[start.y][end.x+1] -= degree
    board[end.y+1][start.x] -= degree
}

//print(solution([[5,5,5,5,5],[5,5,5,5,5],[5,5,5,5,5],[5,5,5,5,5]],[[1,0,0,3,4,4],[1,2,0,2,3,2],[2,1,0,3,1,2],[1,0,1,3,3,1]]))
print(solution([[1,2,3],[4,5,6],[7,8,9]], [[1,1,1,2,2,4],[1,0,0,1,1,2],[2,2,0,2,0,100]]))
