func solution(_ n:Int, _ left:Int64, _ right:Int64) -> [Int] {
    let startColumn:Int = Int(left)/n
    let endColumn:Int = Int(right)/n
    let startRow:Int = Int(left)%n
    let endRow:Int = Int(right)%n
    var answer:[Int] = []

    for i in startColumn...endColumn {
        var numbers:[Int] = Array(repeating: i+1, count:i+1)
        if i+1 < n {
            let tail:[Int] = Array(i+2...n)
            numbers.append(contentsOf:tail)
        }

        if startColumn == endColumn {
            return Array(numbers[startRow...endRow])
        }

        if i == startColumn {
            answer.append(contentsOf: Array(numbers[startRow...]))
            continue
        }

        if i == endColumn {
            answer.append(contentsOf: Array(numbers[0...endRow]))
            continue
        }
        answer.append(contentsOf: numbers)
    }

    return answer
}
