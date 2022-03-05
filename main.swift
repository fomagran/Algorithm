func solution(_ n:Int) -> Int {
    if n == 1 { return 1}
    var cur = 0
    var answer = 0
    for i in 1...n-1 {
        cur += i
        answer += cur
    }
    return answer+1
}

print(solution(5))
