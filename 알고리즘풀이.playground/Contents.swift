import Foundation

struct Current {
    let x:Int
    let y:Int
    let d:Int
    let dontMove:[Command]
    let count:Int
}

enum Command:CaseIterable {
    case up
    case down
    case left
    case right
    case rotateClockwise1
    case rotateAntiClockwise1
    case rotateClockwise2
    case rotateAntiClockwise2
}

var map:[[Int]] = []
var n:Int = 0
var answer = 0
var queue:[Current] = [Current(x: 0, y:0,d:0,dontMove: [], count: 0)]
let direction = [[1,0],[0,-1],[-1,0],[0,1]]
let manhattan = [[-1,-1],[-1,1],[1,1],[1,-1]]
let counterManhattan = [[1,1],[1,-1],[-1,-1],[-1,1]]

func solution(_ board:[[Int]]) -> Int {
    map = board
    n = board.count - 1
    
    while answer == 0 {
        let first = queue.removeFirst()
        moveBFS(current:first)
    }
    return answer
}

func moveBFS(current:Current) {
    if current.x + direction[current.d][0] == n && current.y + direction[current.d][1] == n {
        answer = current.count
        return
    }
    
    if isEnabled(current: current) {
        let allCommand = Command.allCases
        for (i,move) in allCommand.enumerated() {
            if current.d%2 == 0  {
                if i == 0 || i == 1 {continue}
            }else {
                if i == 2 || i == 3 {continue}
            }
            if !current.dontMove.contains(move) {
                if isRotatable(current: current, rotate: move) {
                    moveByCommand(current: current, command: move,count: current.count)
                }
            }
        }
    }
}

func isEnabled(current:Current) -> Bool {
    if 0...n ~= current.x && 0...n ~= current.y && 0...n ~= current.x + direction[current.d][0] && 0...n ~= current.y + direction[current.d][1] {
        if map[current.y][current.x] != 1 && map[current.y + direction[current.d][1]][current.x + direction[current.d][0]] != 1 {
            return true
        }else {
            return false
        }
    }
    return false
}

func isRotatable(current:Current,rotate:Command) -> Bool {
    var counterDirection = 0
    if current.d == 0 {
        counterDirection = 2
    }else if current.d == 1 {
        counterDirection = 3
    }else if current.d == 2 {
        counterDirection = 0
    }else {
        counterDirection = 1
    }
    
    let x2 = current.x + direction[current.d][0]
    let y2 = current.y + direction[current.d][1]
    
    if rotate ==  .rotateClockwise1 {
        let mx = current.x + manhattan[current.d][0]
        let my = current.y + manhattan[current.d][1]
        if 0...n ~= mx && 0...n ~= my {
            return map[my][mx] == 0
        }else {
            return false
        }
    }else if rotate == .rotateClockwise2 {
        let mx = x2 + manhattan[counterDirection][0]
        let my = y2 + manhattan[counterDirection][1]
        if 0...n ~= mx && 0...n ~= my {
            return map[my][mx] == 0
        }else {
            return false
        }
    }else if rotate == .rotateAntiClockwise1 {
        let mx = current.x + counterManhattan[current.d][0]
        let my = current.y + counterManhattan[current.d][1]
        if 0...n ~= mx && 0...n ~= my {
            return map[my][mx] == 0
        }else {
            return false
        }
    }else if rotate == .rotateAntiClockwise2 {
        let mx = x2 + counterManhattan[counterDirection][0]
        let my = y2 + counterManhattan[counterDirection][1]
        if 0...n ~= mx && 0...n ~= my {
            return map[my][mx] == 0
        }else {
            return false
        }
    }else {
        return true
    }
}

func moveByCommand(current:Current,command:Command,count:Int) {
    let nextDirection1 = current.d < 3 ? current.d + 1 : 0
    let pastDirection1 = current.d > 0 ? current.d - 1 : 3
    var counterDirection = 0
    if current.d == 0 {
        counterDirection = 2
    }else if current.d == 1 {
        counterDirection = 3
    }else if current.d == 2 {
        counterDirection = 0
    }else {
        counterDirection = 1
    }
    
    let nextDirection2 = counterDirection < 3 ? counterDirection + 1 : 0
    let pastDirection2 = counterDirection > 0 ? counterDirection - 1 : 3
    
    switch command {
    case .up:
        queue.append(Current(x: current.x, y: current.y-1, d: current.d, dontMove: current.dontMove + [.up], count: current.count))
    case .down:
        queue.append(Current(x:current.x , y: current.y+1,d: current.d,dontMove: current.dontMove + [.down],count: current.count + 1))
    case .left:
        queue.append(Current(x:current.x-1 , y: current.y,d: current.d,dontMove: current.dontMove + [.left],count: current.count))
    case .right:
        queue.append(Current(x:current.x+1 , y: current.y,d: current.d,dontMove: current.dontMove+[.right],count: current.count + 1))
    case .rotateClockwise1:
        queue.append(Current(x:current.x , y: current.y,d: nextDirection1,dontMove: current.dontMove+[.rotateClockwise1],count: current.count+1))
    case .rotateAntiClockwise1:
        queue.append(Current(x:current.x , y: current.y,d: pastDirection1,dontMove: current.dontMove+[.rotateAntiClockwise1],count: current.count+1))
    case .rotateClockwise2:
        queue.append(Current(x:current.x+direction[current.d][0] , y: current.y+direction[current.d][1],d: nextDirection2,dontMove: current.dontMove+[.rotateClockwise2],count: current.count+1))
    case .rotateAntiClockwise2:
        queue.append(Current(x:current.x+direction[current.d][0], y:current.y+direction[current.d][1],d: pastDirection2,dontMove: current.dontMove+[.rotateAntiClockwise2],count: current.count+1))
    }
}

solution([[0, 0, 0, 0, 0],[0, 0, 0, 0, 0],[0, 0, 0, 0, 0],[0, 0, 0, 0, 0],[0, 0, 0, 0, 0]])


