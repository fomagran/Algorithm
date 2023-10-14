import Foundation

func solution(_ weights:[Int]) -> Int64 {
    var weightDic: [Int: Int] = [:]
    var weightsNoOverlap = Set<Int>()
    var answer: Int = 0
    var dic: [Int: [Int]] = [:]
    
    for weight in weights {
        weightDic[weight, default: 0] += 1
        weightsNoOverlap.insert(weight)
    }
    
    for weight in weightDic.filter({ $0.value > 1 }) {
        for i in 1..<weight.value {
            answer += i
        }
    }
    
    for weight in weightsNoOverlap.sorted() {
        for i in 2...4 {
            if dic[weight * i] != nil {
                for n in dic[weight * i]! {
                    answer += weightDic[n]! * weightDic[weight]!
                }
            }
            dic[weight * i, default: []].append(weight)
        }
    }
    
    return Int64(answer)
}

solution([100,180,360,100,270])
solution([100,180,360,100,270,360,50,50,100])
