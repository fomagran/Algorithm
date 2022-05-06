func generateParenthesis(_ n: Int) -> [String] {
    var answer:[String] = []
    
    func add(_ str:String,_ openCount:Int,_ closeCount:Int) {
        if str.count == n*2 {
            answer.append(str)
            return
        }
        
        if openCount < n {
            add(str+"(", openCount+1, closeCount)
        }
        
        if openCount > closeCount {
            add(str+")", openCount,closeCount+1)
        }
    }
    
    add("(",1,0)
    return answer
}

print(generateParenthesis(1))
