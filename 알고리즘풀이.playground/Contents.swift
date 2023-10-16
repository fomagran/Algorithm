import Foundation

func solution(_ k:Int, _ tangerine:[Int]) -> Int {
    var tanDic: [Int: Int] = [:]
    var k: Int = k
    var result: Int = 0
    
    for t in tangerine {
        tanDic[t, default: 0] += 1
    }
    
    let sorted = tanDic.values.sorted { $0 > $1 }
    
    for n in sorted {
        k -= n
        result += 1
        
        if k <= 0 {
            break
        }
    }
    
    return result
}

solution(6, [1, 3, 2, 5, 4, 5, 2, 3])
solution(4, [1, 3, 2, 5, 4, 5, 2, 3])
solution(2, [1, 1, 1, 1, 2, 2, 2, 3])
