
func partition(_ s: String) -> [[String]] {
    let sMap = s.map{ String($0) }
    var answer = [[String]]()
    
    func dfs(_ sMap: [String], _ index: Int, _ strArray: [String], _ answer: inout Set<[String]>) {
        if index == sMap.count {
            return
        }
        
        let newArray = strArray + [sMap[index]]
        
        if isPalindrome(newArray.joined()) {
            answer.insert(newArray)
        }
        
        for i in index+1..<sMap.count {
            dfs(sMap,i,newArray,&answer)
        }
    }
    
    func isPalindrome(_ str: String) -> Bool {
        return str == String(str.reversed())
    }
