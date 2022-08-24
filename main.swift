import Foundation

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    var cumulativeSum: [Int] = [0]
    let q1Length: Int = queue1.count
    let q2Length: Int = queue2.count
    var answer: Int = Int.max
    
    for q in queue1 {
        let last = cumulativeSum.last!
        cumulativeSum.append(last + q)
    }
    
    for q in queue2 {
        let last = cumulativeSum.last!
        cumulativeSum.append(last + q)
    }
    
    let halfTotal: Int = cumulativeSum.last!/2
    
    if cumulativeSum.last!%2 == 1 {
        return -1
    }
    
    if cumulativeSum[q1Length] == halfTotal {
        return 0
    }
    
    func getWorkCount(l: Int, r: Int) -> Int {
        if 0..<queue1.count ~= l {
            if r == q1Length - 1 {
                return l
            }
            if 0..<q1Length ~= r {
                return l + r + q2Length + 1
            } else {
                return l + r - q1Length + 1
            }
        }
        
        return r + 1 + (l-q1Length)
    }
    
    var start: Int = 0
    
    for i in 1..<cumulativeSum.count {
        if cumulativeSum[i] - cumulativeSum[start] > halfTotal {
            while cumulativeSum[i] - cumulativeSum[start] > halfTotal {
                start += 1
            }
        }
        
        if cumulativeSum[i] - cumulativeSum[start] == halfTotal {
            answer = min(answer,getWorkCount(l: start, r: i-1))
        }
    }
    
    return answer == Int.max ? -1 : answer
}

print(solution([3,2,7,2], [4,6,5,1]))
print(solution([1,2,1,2], [1,10,1,2]))
print(solution([2,1], [1,2]))
print(solution([1,1,3], [3]))
