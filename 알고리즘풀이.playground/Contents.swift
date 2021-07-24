import Foundation

struct CurrentLocation {
    let x1:Int
    let y1:Int
    let x2:Int
    let y2:Int
    let isEnabled:Bool
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
    moveBFS(current: CurrentLocation(x1: 0, y1: 0, x2: 0, y2: 0, isEnabled: true), count: 0)
    return answers.min() ?? 0
}

func moveBFS(current:CurrentLocation,count:Int) {
    if !current.isEnabled { return }
    
    if (current.x1 == n && current.y1 == n) || (current.x2 == n && current.y2 == n) {
        answers.append(count)
        return
    }
    
    let counterCommand:[Command] = [.down,.up,.right,.left,.rotateAntiClockwise1,.rotateClockwise1,.rotateAntiClockwise2,.rotateAntiClockwise1]
    let allCommand = Command.allCases
    
    let moves = [moveUp(current: current),moveDown(current: current),moveLeft(current: current),moveRight(current: current),rotateClockwise1(current: current),rotateAntiClockwise1(current: current),rotateClockwise2(current: current),rotateAntiClockwise2(current: current)]
    
    for (i,move) in moves.enumerated() {
        if allCommand[i] != dontMove { move }
    }
}

func moveUp(current:CurrentLocation) -> CurrentLocation {
        return CurrentLocation(x1:current.x1 , y1: current.y1-1, x2: current.x2, y2: current.y2-1, isEnabled: isEnabled(current: current, command: .up))
}

func moveDown(current:CurrentLocation) -> CurrentLocation {
        return CurrentLocation(x1:current.x1 , y1: current.y1+1, x2: current.x2, y2: current.y2+1, isEnabled: isEnabled(current: current, command: .down))
}

func moveLeft(current:CurrentLocation) -> CurrentLocation {
        return CurrentLocation(x1:current.x1-1 , y1: current.y1, x2: current.x2-1, y2: current.y2, isEnabled: isEnabled(current: current, command: .left))
}

func moveRight(current:CurrentLocation) -> CurrentLocation {
        return CurrentLocation(x1:current.x1+1 , y1: current.y1, x2: current.x2+1, y2: current.y2, isEnabled: isEnabled(current: current, command: .right))
}

func rotateClockwise1(current:CurrentLocation) -> CurrentLocation {
        return CurrentLocation(x1:current.x1 , y1: current.y1, x2: current.x1, y2: current.y1+1, isEnabled: isEnabled(current: current, command: .rotateClockwise1))
}

func rotateAntiClockwise1(current:CurrentLocation) -> CurrentLocation {
        return CurrentLocation(x1:current.x1 , y1: current.y1, x2: current.x1, y2: current.y1-1, isEnabled:isEnabled(current: current, command: .rotateAntiClockwise1) )
}

func rotateClockwise2(current:CurrentLocation) -> CurrentLocation {
        return CurrentLocation(x1:current.x2 , y1: current.y1-1, x2: current.x2, y2: current.y2, isEnabled:isEnabled(current: current, command: .rotateClockwise2))
}

func rotateAntiClockwise2(current:CurrentLocation) -> CurrentLocation {
        return CurrentLocation(x1:current.x2 , y1: current.y1+1, x2: current.x2, y2: current.y2, isEnabled:isEnabled(current: current, command: .rotateAntiClockwise2))
}

func isVertical(current:CurrentLocation) -> Bool {
    return current.y1 == current.y2
}

func isEnabled(current:CurrentLocation,command:Command) -> Bool {
    switch command {
    case .up:
        return current.y1 > 0 && map[current.y1-1][current.x1] != 1
    case .down:
        return current.y2 < n && map[current.y2+1][current.x1] != 1
    case .left:
        return current.x1 > 0 && map[current.y1][current.x1+1] != 1
    case .right:
        return current.x2 < n && map[current.y2][current.x2+1] != 1
    case .rotateClockwise1,.rotateAntiClockwise2:
        if isVertical(current: current) {
            return current.x1 > 0 && map[current.y1][current.x1-1] != 1 && map[current.y2][current.x2-1] != 1
        }else {
            return current.y1 < n && map[current.y1+1][current.x1] != 1 && map[current.y2+1][current.x2] != 1
        }
    case .rotateClockwise2,.rotateAntiClockwise1:
        if isVertical(current: current) {
            return current.x1 < n && map[current.y1][current.x1+1] != 1 && map[current.y2][current.x2+1] != 1
        }else {
            return current.y1 > 0 && map[current.y1-1][current.x1] != 1 && map[current.y2-1][current.x2] != 1
        }
    }
}



