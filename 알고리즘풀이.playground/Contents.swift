import Foundation

struct CurrentLocation {
    let x1:Int
    let y1:Int
    let x2:Int
    let y2:Int
}

enum Command:CaseIterable {
    case left
    case right
    case rotateClockwise1
    case rotateAntiClockwise1
    case rotateClockwise2
    case rotateAntiClockwise2
}

struct Move {
    var dontMoves:[Command]
    var current:CurrentLocation
    var count:Int
}

var map:[[Int]] = []
var n:Int = 0
var answer = 0
var queue:[Move] = [Move(dontMoves: [], current: CurrentLocation(x1: 0, y1: 0, x2: 1, y2: 0), count: 0)]

func solution(_ board:[[Int]]) -> Int {
    map = board
    n = board.count - 1
    
    
    while answer == 0 {
        let first = queue.removeFirst()
        var newCurrent = first.current
        if isVertical(current: first.current)  {
            if first.current.y1 > first.current.y2 {
                newCurrent = CurrentLocation(x1: first.current.x2, y1: first.current.y2, x2: first.current.x1, y2: first.current.y1)
            }
        }else {
            if first.current.x1 > first.current.x2 {
                newCurrent = CurrentLocation(x1: first.current.x2, y1: first.current.y2, x2: first.current.x1, y2: first.current.y1)
            }
        }
        moveBFS(dontMoves: first.dontMoves, current:newCurrent, count: first.count)
    }
    return answer
}

func moveBFS(dontMoves:[Command],current:CurrentLocation,count:Int) {
    if (current.x1 == n && current.y1 == n) || (current.x2 == n && current.y2 == n) {
        answer = count
        return
    }
    
    let allCommand = Command.allCases
    
    for move in allCommand {
        if !dontMoves.contains(move) {
            moveByCommand(current: current, command: move,count: count)
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

func rotateVerticalClockwise1(current:CurrentLocation) -> CurrentLocation {
    return CurrentLocation(x1:current.x1 , y1: current.y1, x2: current.x1-1, y2: current.y1)
}

func rotateAntiClockwise1(current:CurrentLocation) -> CurrentLocation {
    return CurrentLocation(x1:current.x1 , y1: current.y1, x2: current.x1, y2: current.y1-1)
}

func rotateVerticalAntiClockwise1(current:CurrentLocation) -> CurrentLocation {
    return CurrentLocation(x1:current.x1 , y1: current.y1, x2: current.x1+1, y2: current.y1)
}

func rotateClockwise2(current:CurrentLocation) -> CurrentLocation {
    return CurrentLocation(x1:current.x2 , y1: current.y2-1, x2: current.x2, y2: current.y2)
}

func rotateVerticalClockwise2(current:CurrentLocation) -> CurrentLocation {
    return CurrentLocation(x1:current.x2+1 , y1: current.y2, x2: current.x2, y2: current.y2)
}

func rotateAntiClockwise2(current:CurrentLocation) -> CurrentLocation {
    return CurrentLocation(x1:current.x2 , y1: current.y2+1, x2: current.x2, y2: current.y2)
}

func rotateVerticalAntiClockwise2(current:CurrentLocation) -> CurrentLocation {
    return CurrentLocation(x1:current.x2-1 , y1: current.y2, x2: current.x2, y2: current.y2)
}

func isVertical(current:CurrentLocation) -> Bool {
    return current.x1 == current.x2
}

func moveByCommand(current:CurrentLocation,command:Command,count:Int) {
    switch command {
    case .left:
        if isVertical(current: current) {
            if current.y1 > 0 {
                if map[current.y1-1][current.x1] != 1 {
                    queue.append(Move(dontMoves: [.right], current: moveUp(current: current), count:count+1))
                }
            }
        }else {
            if current.x1 > 0 {
                if map[current.y1][current.x1-1] != 1 {
                    queue.append(Move(dontMoves: [.right], current: moveLeft(current: current), count:count+1))
                    
                }
            }
        }
    case .right:
        if isVertical(current: current) {
            if current.y2 < n {
                if map[current.y2+1][current.x1] != 1 {
                    queue.append(Move(dontMoves: [.left], current: moveDown(current: current), count:count+1))
                }
            }
        }else {
            if current.x2 < n && map[current.y2][current.x2+1] != 1 {
                queue.append(Move(dontMoves: [.left], current: moveRight(current: current), count:count+1))
            }
            
        }
    case .rotateClockwise1:
        if isVertical(current: current) {
            if current.x1 > 0 {
                if map[current.y1][current.x1-1] != 1 && map[current.y2][current.x2-1] != 1 {
                    queue.append(Move(dontMoves: [.rotateClockwise1,.rotateAntiClockwise1,.rotateClockwise2,.rotateAntiClockwise2], current: rotateVerticalClockwise1(current: current), count:count+1))
                }
            }
        }else {
            if current.y1 < n {
                if map[current.y1+1][current.x1] != 1 && map[current.y2+1][current.x2] != 1 {
                    queue.append(Move(dontMoves:[.rotateClockwise1,.rotateAntiClockwise1,.rotateClockwise2,.rotateAntiClockwise2], current: rotateClockwise1(current: current), count:count+1))
                }
            }
        }
    case  .rotateAntiClockwise1:
        if isVertical(current: current) {
            if current.x1 < n {
                if map[current.y1][current.x1+1] != 1 && map[current.y2][current.x2+1] != 1 {
                    queue.append(Move(dontMoves:[.rotateClockwise1,.rotateAntiClockwise1,.rotateClockwise2,.rotateAntiClockwise2], current: rotateVerticalAntiClockwise1(current: current), count:count+1))
                }
            }
        }else {
            if current.y1 > 0 {
                if map[current.y1-1][current.x1] != 1 && map[current.y2-1][current.x2] != 1 {
                    queue.append(Move(dontMoves: [.rotateClockwise1,.rotateAntiClockwise1,.rotateClockwise2,.rotateAntiClockwise2], current: rotateAntiClockwise1(current: current), count:count+1))
                }
            }
        }
    case .rotateClockwise2:
        if isVertical(current: current) {
            if current.x1 < n {
                if map[current.y1][current.x1+1] != 1 && map[current.y2][current.x2+1] != 1 {
                    queue.append(Move(dontMoves: [.rotateClockwise1,.rotateAntiClockwise1,.rotateClockwise2,.rotateAntiClockwise2], current: rotateVerticalClockwise2(current: current), count:count+1))
                }
            }
        }else {
            if current.y1 > 0 {
                if map[current.y1-1][current.x1] != 1 && map[current.y2-1][current.x2] != 1 {
                    queue.append(Move(dontMoves:[.rotateClockwise1,.rotateAntiClockwise1,.rotateClockwise2,.rotateAntiClockwise2], current: rotateClockwise2(current: current), count:count+1))
                }
            }
        }
    case .rotateAntiClockwise2:
        if isVertical(current: current) {
            if current.x1 > 0 {
                if map[current.y1][current.x1-1] != 1 && map[current.y2][current.x2-1] != 1 {
                    queue.append(Move(dontMoves: [.rotateClockwise1,.rotateAntiClockwise1,.rotateClockwise2,.rotateAntiClockwise2], current: rotateVerticalAntiClockwise2(current: current), count:count+1))
                }
            }
        }else {
            if current.y1 < n {
                if map[current.y1+1][current.x1] != 1 && map[current.y2+1][current.x2] != 1 {
                    queue.append(Move(dontMoves:[.rotateClockwise1,.rotateAntiClockwise1,.rotateClockwise2,.rotateAntiClockwise2], current: rotateAntiClockwise2(current: current), count:count+1))
                }
            }
        }
    }
}

solution([[0, 0, 0, 0, 0],[0, 0, 0, 0, 0],[0, 0, 0, 0, 0],[0, 0, 0, 0, 0],[0, 0, 0, 0, 0]])


