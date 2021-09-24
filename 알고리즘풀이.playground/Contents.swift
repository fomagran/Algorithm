import Foundation

enum Direction{
    case up,down,left,right
    var value:(Int,Int) {
        switch self {
        case .up:
            return (0,-1)
        case .down:
            return (0,1)
        case .left:
            return (-1,0)
        case .right:
            return (1,0)
        }
    }
}

struct Location:Equatable {
    var x:Int,y:Int,d:Direction
}

func solution(_ grid:[String]) -> [Int] {
    let next:[String:[Direction:Direction]] = ["L":[.down:.right,.right:.up,.up:.left,.left:.down],"R":[.down:.left,.right:.down,.up:.right,.left:.up],"S":[.down:.down,.right:.right,.up:.up,.left:.left]]
    var answer:[Int] = []
    let g = grid.map{$0.map{String($0)}}
    var visited = Array(repeating: Array(repeating:[Direction.up:false,Direction.down:false,Direction.right:false,Direction.left:false], count: g[0].count), count: g.count)
    
    for y in 0..<g.count {
        for x in 0..<g[0].count {
            for d in [Direction.up,.down,.left,.right] {
               checkCycle(first: Location(x: x, y: y, d: d), answer: &answer, visited: &visited, g: g, next: next)
            }
        }
    }
    return answer.sorted()
}

func checkCycle(first:Location,answer:inout [Int],visited:inout [[[Direction:Bool]]],g:[[String]],next:[String:[Direction:Direction]]) {
    var location:Location = first
    var count:Int = 0
    while true {
        if visited[location.y][location.x][location.d]! { break }
        visited[location.y][location.x][location.d] = true
        count += 1
        let direction = g[location.y][location.x]
        location.d = next[direction]![location.d]!
        location.x += location.d.value.0
        location.y += location.d.value.1
        location.x = location.x < 0 ? g[0].count-1 : location.x%g[0].count
        location.y = location.y < 0 ? g.count-1 : location.y%g.count
        if location == first && count != 0{
            answer.append(count)
            break
        }
    }
}

solution(["SL","LR"])
//solution(["S"])
//solution(["R","R"])
