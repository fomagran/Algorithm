func lengthOfLongestSubstring(_ s: String) -> Int {
    var maxLength: Int = 0
    var dic:[Character:[Int]] = [:]
    var start: Int = 0
    var end: Int = -1
    
    for (i,c) in s.enumerated() {
        if dic[c] == nil {
            dic[c] = [i]
        } else {
            let first = dic[c]!.removeFirst()
            start = first >= start ? first+1 : start
            dic[c]!.append(i)
        }
        end += 1
        maxLength = max(maxLength,end-start+1)
    }
    return maxLength
}

print(lengthOfLongestSubstring("abcabcbb"))
