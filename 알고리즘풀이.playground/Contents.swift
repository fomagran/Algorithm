func solution(_ a:[Int]) -> Int {
    return findMaxLength(a: a)
}

func countNumbers(a:[Int]) -> [Int:Int] {
    var countDic:[Int:Int] = [:]
    for n in a {
        if countDic[n] == nil {
            countDic[n] = 1
        }else {
            countDic[n]! += 1
        }
    }
    return countDic
}

func findLongSubsequence(n:Int,a:[Int]) -> Int {
    var numbers = a
    var length:Int = 0
    if a[0] == n && a[1] != n {
        length += 2
        numbers[1] = n
    }
    for i in 1..<numbers.count-1 {
        if a[i] == n {
            if numbers[i-1] != n {
                numbers[i-1] = n
                length += 2
            }else if numbers[i+1] != n  {
                numbers[i+1] = n
                length += 2
            }
        }
    }
    if numbers[a.count-1] == n && numbers[a.count-2] != n {
        length += 2
    }
    return length
}

func findMaxLength(a:[Int]) -> Int {
    var answer:Int = 0
    let sortCounts = countNumbers(a: a).sorted{$0.value > $1.value}
    for dic in sortCounts {
        if dic.value * 2 < answer { continue }
        let length = findLongSubsequence(n:dic.key, a:a)
        answer = max(answer,length)
    }
    return answer
}


solution([0, 3, 1, 6, 0, 2, 0, 7, 1, 3, 4, 0, 5, 1, 1])
solution([0, 0, 3, 1, 2, 1, 3, 4, 0, 1, 4])
solution([1, 2, 3, 1, 1, 4, 5, 1])
solution([2, 1, 1, 3, 4, 1, 1, 5])
solution([1, 2, 1, 3, 1, 4, 1, 5])
solution([2, 1, 3, 1, 4, 1, 5, 1])
solution([1, 2, 1, 3, 1, 4, 1, 5, 1])
solution([1, 2, 1, 3, 1, 1, 4, 1, 5, 1])
solution([2, 3, 4, 1, 1, 1, 1, 5, 6, 7])




