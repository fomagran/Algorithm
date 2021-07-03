import Foundation

func solution(_ numbers:[Int64]) -> [Int64] {
    var answer:[Int64] = []
    
    for n in numbers {
        answer.append(findMinNumber(n: n))
    }
    
    return answer
}

func makeDecimalToBinary(decimal:Int64) -> String {

    return String(decimal, radix: 2)
}

func findMinNumber(n:Int64) -> Int64 {
    var x:Int64 = n + 1
    let nBinary = makeDecimalToBinary(decimal: n).map{String($0)}
    

    let max = Int64(pow(10.0, 15.0))
    
    while x <= max {
        var diffrenceCount:Int = 0
        let xBinary = makeDecimalToBinary(decimal: x).map{String($0)}
        
        for i in 0..<nBinary.count {
            if xBinary[xBinary.count - (i+1)] != nBinary[nBinary.count - (i+1)] {
                diffrenceCount += 1
                if diffrenceCount > 2 {
                   break
                }
            }
        }

        if nBinary.count < xBinary.count {
            let d = xBinary.count - nBinary.count
            for i in 0..<d {
                if xBinary[i] != "0" {
                    diffrenceCount += 1
                    if diffrenceCount > 2 {
                       break
                    }
                }
            }
        }
        
        if diffrenceCount <= 2 {
            return x
        }
        x += 1
    }
    return 0
}

solution([2,7])

