import Foundation

struct Current {
    var x:Int
    var y:Int
    let d:Direction
    let dontMove:[Command]
    let count:Int
    var command:Command
}

enum Command:CaseIterable {
    case up
    case down
    case left
    case right
    case rotateClockwise
    case rotateAntiClockwise
    case rotateClockwise2
    case rotateAntiClockwise2
}

enum Direction {
    case up
    case down
    case left
    case right
}

var n:Int = 0

func solution(_ board:[[Int]]) -> Int {
    var answer = 0
    n = board.count - 1
    while answer == 0 {
        
    }
    
    return answer
}


func isVertical() -> Bool {
    return true
}

func move(current:Current,direction:Direction) -> Current {
    var newCurrent = current
    
    return newCurrent
}

func rotate(current:Current,isClockwise:Bool) -> Current {
    var newCurrent = current
    return newCurrent
}

func isVisited() {
    
}

func isEnabled(current:Current) -> Bool {
    var current2 = current2(current: current)
    if 0...n ~= current2.x && 0...n ~= current2.y {
        if current.command == .rotateClockwise {
            
        }else if current.command == .rotateAntiClockwise {
            
        }else if current.command == .rotateClockwise2 {
            
        }else if current.command == .rotateAntiClockwise2 {
            
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
        current2.x  -= 1
    case .right:
        current2.x  += 1
    }
    return current2
}
