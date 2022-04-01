import Foundation

func longestPalindrome(_ s: String) -> String {

    let str:[String] = s.map{String($0)}
    var maxLength:Int = 1
    var longestPalindrome:[String] = []
    for i in 0..<str.count-1 {
        for j in stride(from: str.count-1, to: i+1, by: -1) {
            var length = j-i+1
            var palindrom:[String] = Array(repeating: "", count: length)
            if length <= maxLength { continue }
            
            let middle = length%2 != 0 ? length/2 - 1 : length/2
            for m in 0...middle {
                if str[i+m] != str[j-m] {
                    length += 1
                    break
                }else {
                    palindrom[m] = str[i+m]
                    palindrom[length-m] = str[j-m]
                }
                print(palindrom)
            }
            
            if length == j-i+1 {
                if length > maxLength {
                    maxLength = length
                    longestPalindrome = palindrom
                }
            }
        }
    }
    return longestPalindrome.joined()
}


print(longestPalindrome("cbbd"))
