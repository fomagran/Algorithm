import Foundation

struct Line {
    let x:Int,y:Int,c:Int
}

struct Square {
    var minX:Int = Int.max
    var maxX:Int = -Int.max
    var minY:Int = Int.max
    var maxY:Int = -Int.max
}

struct Meet {
    let x:Int,y:Int
}

func solution(_ line:[[Int]]) -> [String] {
    let meets:[Meet] = getIntegerMeet(lines:line)
    let square = getSquare(meets: meets)
    return changeMeetsToStar(meets: meets, square: square)
}

func changeMeetsToStar(meets:[Meet],square:Square) -> [String] {
    var sqaureDot = Array(repeating: Array(repeating: ".", count: square.maxX-square.minX+1), count: square.maxY-square.minY+1)
    for meet in meets {
        let x = meet.x - square.minX
        let y = square.maxY - meet.y
        sqaureDot[y][x] = "*"
    }
    return sqaureDot.map{$0.joined()}
}

func getIntegerMeet(lines:[[Int]]) -> [Meet] {
    var lines:[[Int]] = lines
    var meets:[Meet] = []
    while !lines.isEmpty {
        let first = lines.removeFirst()
        let firstLine = Line(x:first[0], y:first[1], c: first[2])
        for l in lines {
            let otherLine = Line(x: l[0], y: l[1], c: l[2])
            if let meet = findMeet(firstLine,otherLine) {
                meets.append(meet)
            }
        }
    }
    return meets
}

func getSquare(meets:[Meet]) -> Square {
    var square:Square = Square()
    meets.forEach {
        square.minX = min(square.minX,$0.x)
        square.maxX = max(square.maxX,$0.x)
        square.minY = min(square.minY,$0.y)
        square.maxY = max(square.maxY,$0.y)
    }
    return square
}

func findMeet(_ l1:Line,_ l2:Line) -> Meet? {
    let adbc = l1.x*l2.y - l1.y*l2.x
    if adbc == 0 { return nil }
    let bfed = l1.y*l2.c - l1.c*l2.y
    let ecaf = l1.c*l2.x - l1.x*l2.c
    let meet = Meet(x:bfed/adbc, y:ecaf/adbc)
    return bfed % adbc == 0 && ecaf % adbc == 0 ? meet : nil
}

solution([[2, -1, 4], [-2, -1, 4], [0, -1, 1], [5, -8, -12], [5, 8, 12]])
solution([[0, 1, -1], [1, 0, -1], [1, 0, 1]])
solution([[1, -1, 0], [2, -1, 0]])
solution([[1, -1, 0], [2, -1, 0], [4, -1, 0]])
