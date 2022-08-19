func characterReplacement(_ s: String, _ k: Int) -> Int {
    var dic: [Character:Int] = [:]
    var left: Int = 0
    var maxLength: Int = 0
    let sMap: [Character] = s.map{$0}
    var maxCharCount: Int = 0
    
    for (right,char) in s.enumerated() {
        dic[char,default: 0] += 1
        maxCharCount = max(maxCharCount,dic[char]!)
        
        while right - left + 1 - maxCharCount > k {
            dic[sMap[left]]! -= 1
            left += 1
        }
        
        maxLength = max(maxLength,right - left + 1)
    }
    
    return maxLength
    
}

print(characterReplacement("AABABBA"
                           ,1))
