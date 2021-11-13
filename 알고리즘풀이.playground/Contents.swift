import Foundation

func solution(_ n:Int, _ m:Int, _ x:Int, _ y:Int, _ queries:[[Int]]) -> Int64 {
    var answer:Int64 = 0
    for y1 in 0..<n {
        for x1 in 0..<m {
            var location:(Int,Int) = (x1,y1)
            for q in queries {
                let move = moveByCommand(command: q)
                location = (location.0+move.0,location.1+move.1)
                location.0 = max(0,location.0)
                location.1 = max(0,location.1)
                location.0 = min(m-1,location.0)
                location.1 = min(n-1,location.1)
            }
            if location == (y,x) {
                answer += 1
            }
        }
    }
    return answer
}

func moveByCommand(command:[Int]) -> (Int,Int) {
    switch command[0] {
    case 0:
        return (-command[1],0)
    case 1:
        return (command[1],0)
    case 2:
        return (0,-command[1])
    default:
        return (0,command[1])
    }
}

//solution(2, 2, 0, 0, [[2,1],[0,1],[1,1],[0,1],[2,1]])
solution(2, 5, 0, 1, [[3,1],[2,2],[1,1],[2,3],[0,1],[2,1]])
