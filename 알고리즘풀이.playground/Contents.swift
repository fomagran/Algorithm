import Foundation

func solution(_ x:Int, _ y:Int, _ n:Int) -> Int {
    var queue = [[Int]]()
    var answer: Int = -1
    var visited: [Int: Bool] = [:]
    
    queue.append([x,0])
    
    var index: Int = 0
    
    while index < queue.count {
        let first = queue[index]
        
        index += 1
        
        if first[0] == y {
            answer = first[1]
            break
        }
        
        if first[0] > y || visited[first[0]] != nil {
            continue
        }
        
        visited[first[0]] = true
        
        for i in 1...3 {
            if i == 1 {
                queue.append([first[0] + n, first[1] + 1])
            } else {
                queue.append([first[0] * i,first[1] + 1])
            }
        }
    }
    
    return answer
}


solution(10, 40 , 5)
solution(10, 40 , 30)
solution(2, 5 , 4)
