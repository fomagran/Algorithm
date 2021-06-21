/*
 가운데 글자 기준으로 앞,뒤가 똑같을때
 절반이 앞,뒤가 똑같을때
 
 */
import Foundation

var str:[String] = []
var maxLength:Int = 1

func solution(_ s:String) -> Int {
    str = s.map{String($0)}
    
    if s.count == 2 {
        return str[0] == str[1] ? 2 : 1
    }
    
    var new:[String] = []
    for i in 0..<str.count-1 {
        new = []
        new.append(str[i])
        for j in i+1..<str.count {
            new.append(str[j])
            if new.count <= maxLength { continue }
            let oddRight = new.count%2 != 0
            let middle = oddRight ? new.count/2 - 1 : new.count/2
            var isPal = true
            for i in 0...middle {
                if new[i] != new[new.count - 1 - i] {
                    isPal = false
                    break
                }
            }
            if isPal {
                maxLength = max(maxLength,new.count)
            }
        }
    }
    return maxLength
}

solution("aaabaa")
