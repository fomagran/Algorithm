import Foundation

struct Pillar {
    var current:[[Int]]
    var history:[[Int]]
}

func solution(_ n:Int) -> [[Int]] {
    var pillars:[[Int]] =  Array(repeating: [], count: 3)
    pillars[0].append(contentsOf:(1...n).reversed().map{$0})
    let first = Pillar(current: pillars ,history: [])
    var queue:[Pillar] = [first]
    var answer:[[Int]] = []
    
    while !queue.isEmpty {
        let pillar = queue.removeFirst()
        if pillar.current[2].count == n {
            answer = pillar.history
            break
        }
        for i in 0..<3 {
            for j in 0..<3 {
                let lastHistory = pillar.history.last ?? []
                if pillar.current[i].last ?? 16 < pillar.current[j].last ?? 16 && lastHistory != [j+1,i+1] {
                    var newPillar = pillar
                    let last = newPillar.current[i].removeLast()
                    newPillar.current[j].append(last)
                    newPillar.history.append([i+1,j+1])
                    queue.append(newPillar)
                }
            }
        }
    }
    return answer
}

solution(3)
