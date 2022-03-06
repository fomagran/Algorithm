func lengthOfLongestSubstring(_ s: String) -> Int {
    var answer:Int = 0
    var dic:[Character:Bool] = [:]
    var arr:[Character] = []
    
    for c in s {
        if dic[c] == nil {
            dic[c] = true
        }else {
            answer = max(answer,dic.count)
            removeUntilDuplicatedChar(&arr,&dic,c)
        }
        arr.append(c)
    }
    return max(answer,dic.count)
}

func removeUntilDuplicatedChar(_ arr:inout [Character],_ dic:inout [Character:Bool],_ char:Character) {
    for a in arr {
        arr.removeFirst()
        if a == char {
            break
        }
        dic[a] = nil
    }
}

print(lengthOfLongestSubstring("pwwkew"))


