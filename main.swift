func checkInclusion(_ s1: String, _ s2: String) -> Bool {
    var dic: [Character:Int] = [:]
    var dicCopy:[Character:Int] = [:]
    let s2Map:[Character] = s2.map{$0}
    
    s1.forEach {
        dic[$0,default:0] += 1
        dicCopy[$0,default:0] += 1
    }
    
    var left: Int = 0
    
    for (i,c) in s2.enumerated() {
        if dic[c] == nil {
            if dicCopy[c] != nil {
                while s2Map[left] != c {
                    let leftChar = s2Map[left]
                    dic[leftChar,default:0] = min(dicCopy[leftChar,default: 0] + 1,dic[leftChar]!)
                    left += 1
                }
                left += 1
            } else {
                dic = dicCopy
                left = i+1
            }
            continue
        }
        
        dic[c]! -= 1
        
        if dic[c]! == 0 {
            dic[c] = nil
        }
        
        if dic.isEmpty {
            return true
        }
    }
    
    return false
}


print(checkInclusion("hello","ooolleoooleh"))
print(checkInclusion("abcdef", "abcdeabf"))
print(checkInclusion("abcdef", "abcdoabcdef"))
print(checkInclusion("abcdef", "abcdegf"))
print(checkInclusion("abcdef", "abbcde"))
