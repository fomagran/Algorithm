import Foundation

struct Line {
    let x:Int
    let y:Int
    let c:Int
}

func solution(_ line:[[Int]]) -> [String] {
    var lines:[[Int]] = line
    var meets:[(Int,Int)] = []
    
    while !lines.isEmpty {
        let first = lines.removeFirst()
        let firstLine = Line(x: first[0], y: first[1], c: first[2])
        for l in lines {
            let otherLine = Line(x: l[0], y: l[1], c: l[2])
            if let meet = findMeet(firstLine,otherLine) {
                meets.append(meet)
            }
        }
    }
    
    let xSort = meets.sorted{$0.0 < $1.0}
    let ySort = meets.sorted{$0.1 < $1.1}
    let xMin = xSort.first!.0
    let xMax = xSort.last!.0
    let yMin = ySort.first!.1
    let yMax = ySort.last!.1
    
    var array = Array(repeating: Array(repeating: ".", count: xMax-xMin+1), count: yMax-yMin+1)
    
    for meet in meets {
        let x = xMax - meet.0
        let y = yMax - meet.1
        array[y][x] = "*"
    }
    
    var answer:[String] = []
    
    for a in array {
        answer.append(a.joined())
    }
    
    return answer
}

func findMeet(_ line1:Line,_ line2:Line) -> (Int,Int)? {
    if line1.x*line2.y - line2.x*line1.y == 0 {
        return nil
    }
    let top:Int = (line1.y*line2.c ) - (line2.y*line1.c)
    let bottom:Int = (line1.x*line2.y) - (line2.x*line1.y)
    let x:Double = Double(top)/Double(bottom)
    let y:Double = Double(-(line1.x/line1.y))*x - Double(line1.c)/Double(line1.y)
    return x == floor(x) && y == floor(y) ? (Int(x),Int(y)) : nil
}

solution([[2, -1, 4], [-2, -1, 4], [0, -1, 1], [5, -8, -12], [5, 8, 12]])
solution([[0, 1, -1], [1, 0, -1], [1, 0, 1]])
solution([[1, -1, 0], [2, -1, 0]])
solution([[1, -1, 0], [2, -1, 0], [4, -1, 0]])
