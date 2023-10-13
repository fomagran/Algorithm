
func partition(_ s: String) -> [[String]] {
    let sMap = s.map{ String($0) }
    var answer = [[String]]()
    
    func backtrack(_ depth: Int, _ history: [String]) {
        if depth == s.count {
            answer.append(history)
        }
        
        for i in depth..<s.count {
            let str = sMap[depth..<i+1].joined()
            if isPalindrome(str) {
                backtrack(i+1, history + [str])
            }
        }
    }
    
    backtrack(0, [])
    
    return answer
}



func isPalindrome(_ str: String) -> Bool {
    return str == String(str.reversed())
}

print(partition("aab"))
