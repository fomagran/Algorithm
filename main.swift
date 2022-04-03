import Foundation

func longestPalindrome(_ s: String) -> String {
    let str:[String] = s.map{String($0)}
    var maxLength:Int = 1
    var palStartAndEnd:(Int,Int) = (0,0)
    for i in 0..<str.count-1 {
    jfor:for j in stride(from: str.count-1, through: i+1, by: -1) {
        let length = j-i+1
        if length <= maxLength { continue }
        
        let middle = length%2 != 0 ? length/2 - 1 : length/2
        
        for m in 0...middle {
            if str[i+m] != str[j-m] {
                continue jfor
            }
        }
        maxLength = length
        palStartAndEnd = (i,j)
    }
    }
    let start = s.index(s.startIndex,offsetBy: palStartAndEnd.0)
    let end = s.index(s.startIndex,offsetBy: palStartAndEnd.1)
    return String(s[start...end])
}


print(longestPalindrome("babad"))
