func solution(_ a:[Int]) -> Int {
    if a.count == 1 { return 0}

    var countDic:[Int:Int] = [:]
    var answer:Int = 0
    for n in a {
        if countDic[n] == nil {
            countDic[n] = 1
        }else {
            countDic[n]! += 1
        }
    }

    for dic in countDic.sorted(by: {$0.value > $1.value}) {
        if dic.value * 2 < answer { continue }
        let length = findLongSubsequence(m:dic.key, a:a)
        answer = max(answer,length)
    }
    
    return answer
}

func findLongSubsequence(m:Int,a:[Int]) -> Int {
    var numbers = a
    var length:Int = 0
    if a[0] == m && a[1] != m {
        length += 2
        numbers[1] = m
    }
    for i in 1..<numbers.count-1 {
        if a[i] == m {
            if numbers[i-1] != m {
                numbers[i-1] = m
                length += 2
            }else if numbers[i+1] != m  {
                numbers[i+1] = m
                length += 2
            }
        }
    }
    if numbers[a.count-1] == m && numbers[a.count-2] != m {
        length += 2
    }
    return length
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




