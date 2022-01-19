import Foundation

func solution(_ n:Int, _ k:Int) -> Int {
    let trit = String(n,radix: k)
    let numbers = trit.split(separator: "0")
    return numbers.filter{isPrimeNumber(Int($0)!)}.count
}

func isPrimeNumber(_ n:Int) -> Bool {
    if n == 1  { return false }
    if n == 2 || n == 3 {return true}
    let sq = Int(sqrt(Double(n)))
    for i in 2...sq {
        if n%i == 0 {
            return false
        }
    }
    return true
}

solution(437674, 3)
solution(110011, 10)

