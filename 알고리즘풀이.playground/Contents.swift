import Foundation

/*
 각 칸마다 위,아래,왼쪽,오른쪽으로 빛을 쐈을 때 사이클을 구한다.
 전 방향이 위,아래,왼쪽,오른쪽일 경우 R,L이 어떻게 변할지를 구한다.
 칸과 방향의 방문이력을 체크해서 무한루프를 막는다.
 */

enum Direction {
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
    var x:Int
    var y:Int
    var d:Direction
}

let nextL:[Direction:Direction] = [.down:.right,.right:.up,.up:.left,.left:.down]
let nextR:[Direction:Direction] = [.down:.left,.right:.down,.up:.right,.left:.up]
var answer:[Int] = []
var g:[[String]] = []
var visited:[[[Direction:Bool]]] = []

func solution(_ grid:[String]) -> [Int] {
    g = grid.map{$0.map{String($0)}}
    visited = Array(repeating: Array(repeating:[:], count: g[0].count), count: g.count)
    for y in 0..<g.count {
        for x in 0..<g[0].count {
            for d in [Direction.up,.down,.left,.right] {
                visited[y][x][d] = false
            }
        }
    }
    
    for y in 0..<g.count {
        for x in 0..<g[0].count {
            for d in [Direction.up,.down,.left,.right] {
                checkCycle(first: Location(x: x, y: y, d: d))
            }
        }
    }
        
    return answer.sorted()
}

func checkCycle(first:Location) {
    var newVisited = visited
    var location:Location = first
    location.x += first.d.value.0
    location.y += first.d.value.1
    var count:Int = 1
    
    while true {
        if location == first {
            answer.append(count)
            return
        }
        if location.x == -1 {
            location.x = g.count-1
        }
        
        if location.x == g.count-1 {
            location.x = 0
        }
        
        if location.y == -1 {
            location.y = g.count-1
        }
        
        if location.y == g.count-1 {
            location.y = 0
        }
        
        if newVisited[location.y][location.x][location.d]! {
           return
        }
        
        newVisited[location.y][location.x][location.d] = true
        count += 1
        
        if g[location.y][location.x] == "L" {
            location.d = nextL[location.d]!
        }else if g[location.y][location.x] == "R" {
            location.d = nextR[location.d]!
        }
        location.x += location.d.value.0
        location.y += location.d.value.1
    }
}

solution(["SL","LR"])
