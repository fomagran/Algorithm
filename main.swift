func longestValidParentheses(_ s: String) -> Int {
    var openIndex:[Int] = []
    let smap = s.map{String($0)}
    var maxLength:Int = -1
    var current:Int = 0

    for (i,char) in smap.enumerated() {
        if char == "(" {
            openIndex.append(i-current)
        }else {
            if !openIndex.isEmpty {
                let last:Int = openIndex.removeLast()
                maxLength = max(maxLength,i-last)
                current = i-last+1
                continue
            }
        }
        current = 0
    }

    return maxLength+1
}


print(longestValidParentheses("(()()"))
