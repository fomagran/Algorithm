import Foundation

struct CurrentLocation {
    let x1:Int
    let y1:Int
    let x2:Int
    let y2:Int
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
var answers:[Int] = []

func solution(_ board:[[Int]]) -> Int {
    map = board
    n = board.count - 1
    moveBFS(dontMoves:[],current: CurrentLocation(x1: 0, y1: 0, x2: 0, y2: 0), count: 0)
    return answers.min() ?? 0
}

func moveBFS(dontMoves:[Command],current:CurrentLocation,count:Int) {
    
    if (current.x1 == n && current.y1 == n) || (current.x2 == n && current.y2 == n) {
        answers.append(count)
        return
    }
    
    let allCommand = Command.allCases
    
    let moves = [moveUp(current: current),moveDown(current: current),moveLeft(current: current),moveRight(current: current),rotateClockwise1(current: current),rotateAntiClockwise1(current: current),rotateClockwise2(current: current),rotateAntiClockwise2(current: current)]
    
    for (i,move) in moves.enumerated() {
        if !dontMoves.contains(allCommand[i]) {
            moveByCommand(current: move, command: allCommand[i],count: count)
        }
    }
}

func moveUp(current:CurrentLocation) -> CurrentLocation {
    return CurrentLocation(x1:current.x1 , y1: current.y1-1, x2: current.x2, y2: current.y2-1)
}

func moveDown(current:CurrentLocation) -> CurrentLocation {
    return CurrentLocation(x1:current.x1 , y1: current.y1+1, x2: current.x2, y2: current.y2+1)
}

func moveLeft(current:CurrentLocation) -> CurrentLocation {
    return CurrentLocation(x1:current.x1-1 , y1: current.y1, x2: current.x2-1, y2: current.y2)
}

func moveRight(current:CurrentLocation) -> CurrentLocation {
    return CurrentLocation(x1:current.x1+1 , y1: current.y1, x2: current.x2+1, y2: current.y2)
}

func rotateClockwise1(current:CurrentLocation) -> CurrentLocation {
    return CurrentLocation(x1:current.x1 , y1: current.y1, x2: current.x1, y2: current.y1+1)
}

func rotateAntiClockwise1(current:CurrentLocation) -> CurrentLocation {
    return CurrentLocation(x1:current.x1 , y1: current.y1, x2: current.x1, y2: current.y1-1)
}

func rotateClockwise2(current:CurrentLocation) -> CurrentLocation {
    return CurrentLocation(x1:current.x2 , y1: current.y1-1, x2: current.x2, y2: current.y2)
}

func rotateAntiClockwise2(current:CurrentLocation) -> CurrentLocation {
    return CurrentLocation(x1:current.x2 , y1: current.y1+1, x2: current.x2, y2: current.y2)
}

func isVertical(current:CurrentLocation) -> Bool {
    return current.y1 == current.y2
}

func moveByCommand(current:CurrentLocation,command:Command,count:Int) {
    switch command {
    case .up:
        if isVertical(current: current) {
            if current.y1 > 0 && map[current.y1-1][current.x1] != 1 {
                moveBFS(dontMoves: [.down], current: moveUp(current: current), count:count+1)
            }
        }
    case .down:
        if isVertical(current: current) {
            if current.y2 < n && map[current.y2+1][current.x1] != 1 {
                moveBFS(dontMoves: [.up], current: moveDown(current: current), count:count+1)
            }
        }
    case .left:
        if !isVertical(current: current) {
            if current.x1 > 0 && map[current.y1][current.x1+1] != 1 {
                moveBFS(dontMoves: [.right], current: moveLeft(current: current), count:count+1)
            }
        }
    case .right:
        if !isVertical(current: current) {
            if current.x2 < n && map[current.y2][current.x2+1] != 1 {
                moveBFS(dontMoves: [.left], current: moveRight(current: current), count:count+1)
            }
        }
    case .rotateClockwise1:
        if isVertical(current: current) {
            if current.x1 > 0 && map[current.y1][current.x1-1] != 1 && map[current.y2][current.x2-1] != 1 {
                moveBFS(dontMoves: [.rotateClockwise1,.rotateAntiClockwise1], current: rotateClockwise1(current: current), count:count+1)
            }
        }else {
            if current.y1 < n && map[current.y1+1][current.x1] != 1 && map[current.y2+1][current.x2] != 1 {
                moveBFS(dontMoves: [.rotateClockwise1,.rotateAntiClockwise1], current: rotateClockwise1(current: current), count:count+1)
            }
        }
    case  .rotateAntiClockwise1:
        if isVertical(current: current) {
            if current.x1 < n && map[current.y1][current.x1+1] != 1 && map[current.y2][current.x2+1] != 1 {
                moveBFS(dontMoves: [.rotateClockwise1,.rotateAntiClockwise1], current: rotateAntiClockwise1(current: current), count:count+1)
            }
        }else {
            if current.y1 > 0 && map[current.y1-1][current.x1] != 1 && map[current.y2-1][current.x2] != 1 {
                moveBFS(dontMoves: [.rotateClockwise1,.rotateAntiClockwise1], current: rotateAntiClockwise1(current: current), count:count+1)
            }
        }
    case .rotateClockwise2:
        if isVertical(current: current) {
            if current.x1 < n && map[current.y1][current.x1+1] != 1 && map[current.y2][current.x2+1] != 1 {
                moveBFS(dontMoves: [.rotateClockwise2,.rotateAntiClockwise2], current: rotateClockwise2(current: current), count:count+1)
            }
        }else {
            if current.y1 > 0 && map[current.y1-1][current.x1] != 1 && map[current.y2-1][current.x2] != 1 {
                moveBFS(dontMoves: [.rotateClockwise2,.rotateAntiClockwise2], current: rotateClockwise2(current: current), count:count+1)
            }
        }
    case .rotateAntiClockwise2:
        if isVertical(current: current) {
            if current.x1 > 0 && map[current.y1][current.x1-1] != 1 && map[current.y2][current.x2-1] != 1 {
                moveBFS(dontMoves: [.rotateClockwise2,.rotateAntiClockwise2], current: rotateAntiClockwise2(current: current), count:count+1)
            }
        }else {
            if current.y1 < n && map[current.y1+1][current.x1] != 1 && map[current.y2+1][current.x2] != 1 {
                moveBFS(dontMoves: [.rotateClockwise2,.rotateAntiClockwise2], current: rotateAntiClockwise2(current: current), count:count+1)
            }
        }
    }
}

solution([[0, 0, 0, 1, 1],[0, 0, 0, 1, 0],[0, 1, 0, 1, 1],[1, 1, 0, 0, 1],[0, 0, 0, 0, 0]])


