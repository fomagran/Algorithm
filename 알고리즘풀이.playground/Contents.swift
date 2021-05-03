import Foundation

func solution(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    var answer = 0

    for (i,isPositive) in signs.enumerated() {
        answer += isPositive ? absolutes[i] : -(absolutes[i])
    }
    
    return answer
}
