import Foundation

struct Location {
    let position:CGPoint
    let number:Int
    let type:Int
    let isVertical:Bool
}

var numberTypes:[Int:[[[Int]]]] = [
    1:[[[0,0,1],[1,1,1]],[[1,0],[1,0],[1,1]],[[1,1,1],[1,0,0]],[[1,1],[0,1],[0,1]]],
    2:[[[1,0,0],[1,1,1]],[[1,1],[1,0],[1,0]],[[1,1,1],[0,0,1]],[[0,1],[0,1],[1,1]]],
    3:[[[1,1,1],[0,1,0]],[[1,0],[1,1],[1,0]],[[0,1,0],[1,1,1]],[[0,1],[1,1],[0,1]]]
]

var canRemoveBlocks:[[Int]] = [
    [1,2],[1,3],[2,1],[2,2]
]

var N:Int = 0
var locations:[Location] = []

func solution(_ board:[[Int]]) -> Int {
    N = board.count
    findVerticalBox(board)
    findHorizontalBox(board)
    return countRemovableBlocks(board)
}

func countRemovableBlocks(_ board:[[Int]]) -> Int {
    var count:Int = 0
    var sorted = locations.sorted { loc1, loc2 in
        if loc1.position.y != loc2.position.y {
            return loc1.position.y > loc2.position.y
        }else {
            return loc1.position.x < loc2.position.x
        }
    }
    print(sorted)
outer:for (i,location) in sorted.enumerated() {
    if location.number == 1 {
        if location.type == 2 {
                for s in sorted {
                    let start = s.isVertical ? 0 : -1
                    for x in start...2{
                    if s.position.x == location.position.x+CGFloat(x) && location.position.y < s.position.y {
                        if s.number != location.number || s.type != location.type || s.position != location.position {
                            continue outer
                        }
                    }
                }
            }
            count += 1
            sorted[i] = Location(position: CGPoint(x: -1, y: -1), number: -1, type: -1, isVertical: false)
        }else if location.type == 3 {
                for s in sorted {
                    let start = s.isVertical ? -1 : -2
                    for x in start...0{
                    if s.position.x == location.position.x+CGFloat(x) && location.position.y < s.position.y {
                        if s.number != location.number || s.type != location.type || s.position != location.position {
                            continue outer
                        }
                    }
                }
            }
            count += 1
            sorted[i] = Location(position: CGPoint(x: -1, y: -1), number: -1, type: -1, isVertical: false)
        }
    }else if location.number == 2 {
        if location.type == 1 {
                for s in sorted {
                    let start = s.isVertical ? 0 : -1
                    for x in start...1{
                    if s.position.x == location.position.x+CGFloat(x) && location.position.y < s.position.y {
                        if s.number != location.number || s.type != location.type || s.position != location.position {
                            continue outer
                        }
                    }
                }
            }
            count += 1
            sorted[i] = Location(position: CGPoint(x: -1, y: -1), number: -1, type: -1, isVertical: false)
        }else if location.type == 2 {
                for s in sorted {
                    let start = s.isVertical ? -1 : -2
                    for x in start...1{
                    if s.position.x == location.position.x+CGFloat(x) && location.position.y < s.position.y {
                        if s.number != location.number || s.type != location.type || s.position != location.position {
                            continue outer
                        }
                    }
                }
            }
            count += 1
            sorted[i] = Location(position: CGPoint(x: -1, y: -1), number: -1, type: -1, isVertical: false)
        }
    }else if location.number == 3 {
        if location.type == 0 {
            for s in sorted {
                let start = s.isVertical ? -1 : -2
                for x in start...2 {
                    if s.position.x == location.position.x+CGFloat(x) && location.position.y < s.position.y {
                        if s.number != location.number || s.type != location.type {
                            continue outer
                        }
                    }
                }
            }
            count += 1
            sorted[i] = Location(position: CGPoint(x: -1, y: -1), number: -1, type: -1, isVertical: false)
        }
    }
}
    return count
}

func findVerticalBox(_ board:[[Int]]) {
    for i in 0..<N-2 {
        for j in 0..<N-1 {
            var block:[[Int]] = Array(repeating: [], count: 3)
            for k in 0...2 {
                block[2-k] = Array(board[i+k][j...j+1])
            }
            let change = isExistEqual4Number(block)
            if let change = change {
                let equal = checkEqualBlock(change, isVertical: true, position: CGPoint(x: j, y: N-(i+3)))
                if let equal = equal {
                    locations.append(equal)
                }
            }
        }
    }
}

func findHorizontalBox(_ board:[[Int]]) {
    for i in 0..<N-1 {
        for j in 0..<N-2 {
            var block:[[Int]] = Array(repeating: [], count: 2)
            for k in 0...1 {
                block[1-k] = Array(board[i+k][j...j+2])
            }
            let change = isExistEqual4Number(block)
            if let change = change {
                let equal = checkEqualBlock(change, isVertical: false, position: CGPoint(x: j, y: N-(i+2)))
                if let equal = equal {
                    locations.append(equal)
                }
            }
        }
    }
}

func isExistEqual4Number(_ block:[[Int]]) -> [[Int]]? {
    var numberCount:[Int:Int] = [:]
    var changeBlock:[[Int]] = []
    for b in block {
        for e in b {
            if numberCount[e] == nil {
                numberCount[e] = 1
            }else {
                numberCount[e]! += 1
            }
        }
    }
    
    for (n,c) in numberCount {
        if c == 4 && n != 0 {
            for (i,b) in block.enumerated() {
                changeBlock.append([])
                for e in b {
                    let oneOrZero = e == n ? 1 : 0
                    changeBlock[i].append(oneOrZero)
                }
            }
            return changeBlock
        }
    }
    return nil
}


func checkEqualBlock(_ block:[[Int]],isVertical:Bool,position:CGPoint) -> Location? {
    if isVertical {
        for i in 1...3 {
            for o in [1,3] {
                if numberTypes[i]![o] == block {
                    return Location(position: position, number: i, type: o, isVertical:isVertical)
                }
            }
        }
    }else {
        for i in 1...3 {
            for e in [0,2] {
                if numberTypes[i]![e] == block {
                    return Location(position: position, number: i, type: e, isVertical:isVertical)
                }
            }
        }
    }
    return nil
}
