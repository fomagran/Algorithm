func isValid(_ s: String) -> Bool {
    let sChars = s.map{$0}
    let brackets:[Character:Character] = [")":"(","}":"{","]":"["]
    var openBrackets:[Character] = []
    
    for c in sChars {
        if c == "(" ||  c == "{" || c == "["   {
            openBrackets.append(c)
        }else {
            if openBrackets.isEmpty {
                return false
            }
            
            if openBrackets.removeLast() != brackets[c] {
                return false
            }
        }
    }
    return openBrackets.isEmpty
}

print(isValid("]"))
