func solution(_ numbers:[Int64]) -> [Int64] {
    return numbers.map{findMinNumber(n:$0)}
}

func makeDecimalToBinary(decimal:Int64) -> String {
    return "0" + String(decimal, radix: 2)
}

func makeBinaryToDecimal(binary:String) -> Int64 {
    return Int64(binary,radix: 2)!
}

func findMinNumber(n:Int64) -> Int64 {
    var nBinary = makeDecimalToBinary(decimal: n).map{String($0)}
    for i in 0..<nBinary.count {
        if nBinary[nBinary.count - (i+1)] == "0" {
            nBinary[nBinary.count - (i+1)] = "1"
            if i != 0 {
                nBinary[nBinary.count - i] = "0"
            }
            break
        }
    }
    return makeBinaryToDecimal(binary: nBinary.joined())
}

solution([2,7])

