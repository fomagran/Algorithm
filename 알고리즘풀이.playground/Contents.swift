import Foundation

var answer: [[Int]] = []

func solution(_ n:Int) -> [[Int]] {
    hanoi(n: n, from: 1, to: 3, via: 2)
    return answer
}

func hanoi(n: Int, from: Int, to: Int, via: Int){
    if n == 1 {
        answer.append([from,to])
    }else {
        hanoi(n: n-1,from: from, to: via, via: to)
        answer.append([from,to])
        hanoi(n: n-1, from: via, to: to, via: from)
    }
}

solution(4)
