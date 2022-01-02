import Foundation

func isValidSubsequence(_ array: [Int], _ sequence: [Int]) -> Bool {
    var first = sequence.first
    var sCopy = sequence
    
    for a in array {
        if a == first {
            if !sCopy.isEmpty {
                sCopy.removeFirst()
                if !sCopy.isEmpty {
                    first = sCopy.first
                }else {
                    return true
                }
            }else {
                return true
            }
        }
    }
    return false
}

isValidSubsequence([5, 1, 22, 25, 6, -1, 8, 10],[1, 6, -1, 5])
