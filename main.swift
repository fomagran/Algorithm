import Foundation

func reverse(_ x: Int) -> Int {
    let nOrP = x < 0 ? -1 : 1
    var reverse = Array(String(x).map{String($0)}.reversed())
    if x < 0 {
        reverse.removeLast()
    }
    let answer = Int(Int32(reverse.joined()) ?? 0)
    return answer * nOrP
}


print(reverse(123))
