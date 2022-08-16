func isPalindrome(_ s: String) -> Bool {
    var original:String = ""
    
    s.forEach {
        if $0.isLetter || $0.isNumber {
            original += $0.lowercased()
        }
    }
    
    return original == String(original.reversed())
}

print(isPalindrome("A man, a plan, a canal: Panama"))
