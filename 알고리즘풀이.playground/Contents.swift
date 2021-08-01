import Foundation

struct Current {
    var x:Int
    var y:Int
    var d:Direction
    var dontMove:[String:Bool]
    var count:Int
    var past:Command
}

enum Command:CaseIterable {
    case up,down,left,right,rotateClockwise,rotateAntiClockwise,rotateClockwise2,rotateAntiClockwise2
}

enum Direction:CaseIterable {
    case right,down,left,up
}

func solution(_ board:[[Int]]) -> Int {
    return findMinCountByBFS(board: board)
}

func findMinCountByBFS(board:[[Int]]) -> Int {
    let allCommand = Command.allCases
    var queue:[Current] = [Current(x: 0, y: 0, d: .right, dontMove: [:], count: 0, past: .right)]
    
    while !queue.isEmpty {
        var first = queue.removeFirst()
        let current2 = current2(current: first)
        
        if current2.x == board.count-1 && current2.y == board.count-1 {
            return first.count
        }

        first.count += 1
        
        for command in allCommand {
            var newCurrent = move(current: first, command: command)
            newCurrent.past = command
            if isEnabled(current:newCurrent,b:board) {
                newCurrent.dontMove["\(first.x)\(first.y)\(first.d)"] = true
                queue.append(newCurrent)
            }
        }
    }
    return 0
}

func move(current:Current,command:Command) -> Current {
    let allDirection = Direction.allCases
    let index = allDirection.firstIndex(of: current.d) ?? -1
    let current2 = current2(current: current)

    var newCurrent = current
    switch command {
    case .up:
        newCurrent.y -= 1
    case .down:
        newCurrent.y += 1
    case .left:
        newCurrent.x -= 1
    case .right:
        newCurrent.x += 1
    case .rotateClockwise:
        newCurrent.d = index == 3 ? .right:allDirection[index+1]
    case .rotateClockwise2:
        newCurrent.x = current2.x
        newCurrent.y = current2.y
        newCurrent.d = index == 0 ? .up :allDirection[index-1]
    case .rotateAntiClockwise:
        newCurrent.d = index == 0 ? .up:allDirection[index-1]
    case .rotateAntiClockwise2:
        newCurrent.x = current2.x
        newCurrent.y = current2.y
        newCurrent.d = index == 3 ? .right :allDirection[index+1]
    }
    return newCurrent
}

func isEnabled(current:Current,b:[[Int]]) -> Bool {

    if current.dontMove["\(current.x)\(current.y)\(current.d)"] == nil {
        let current2 = current2(current: current)
        if 0..<b.count ~= current.x && 0..<b.count ~= current.y && 0..<b.count ~= current2.x && 0..<b.count ~= current2.y {
            if b[current.y][current.x] == 0 &&  b[current2.y][current2.x] == 0 {
                if current.past == .rotateClockwise || current.past == .rotateClockwise2{
                    
                    switch current.d {
                    case .up:
                        return b[current.y-1][current.x-1] == 0
                    case .down:
                        return b[current.y+1][current.x+1] == 0
                    case .left:
                        return b[current.y+1][current.x-1] == 0
                    case .right:
                        return b[current.y-1][current.x+1] == 0
                    }
                }else if current.past == .rotateAntiClockwise || current.past == .rotateAntiClockwise2{
                    switch current.d {
                    case .up:
                        return b[current.y-1][current.x+1] == 0
                    case .down:
                        return b[current.y+1][current.x-1] == 0
                    case .left:
                        return b[current.y-1][current.x-1] == 0
                    case .right:
                        return b[current.y+1][current.x+1] == 0
                    }
                }else {
                    return true
                }
            }
        }
    }
    return false
}

func current2(current:Current) -> Current {
    var current2 = current
    switch current.d {
    case .up:
        current2.y -= 1
    case .down:
        current2.y += 1
    case .left:
        current2.x -= 1
    case .right:
        current2.x += 1
    }
    return current2
}

solution([[0, 0, 0, 1, 1],[0, 0, 0, 1, 0],[0, 1, 0, 1, 1],[1, 1, 0, 0, 1],[0, 0, 0, 0, 0]])
