func isSubsequence(_ s: String, _ t: String) -> Bool {
    if s.count == 0 {
        return true
    }
    
    let sMap = Array(s)
    let tMap = Array(t)
    var current = 0
    
    for c in tMap {
        if c == sMap[current] {
            current += 1
        }
        if current == s.count {
            break
        }
    }
    
    return current >= s.count
}
