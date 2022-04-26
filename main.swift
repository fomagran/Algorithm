var answer:[String] = []

func letterCombinations(_ digits: String) -> [String] {
    let alphabets = [["a","b","c"],["d","e","f"],["g","h","i"],["j","k","l"],["m","n","o"],["p","q","r","s"],["t","u","v"],["w","x","y","z"]]
    
    if digits.count == 0 {
        return []
    }

    if digits.count == 1 {
        return alphabets[(Int(digits)!) - 2]
    }
    
    let keypad:[[String]] = digits.map{alphabets[Int(String($0))! - 2]}
    dfs(keypad, depth: 0, str: "")
    return answer
}

func dfs(_ keypad:[[String]],depth:Int,str:String) {
    if depth == keypad.count {
        answer.append(str)
        return
    }
    
    for char in keypad[depth] {
        dfs(keypad, depth: depth+1, str: str+char)
    }
}

print(letterCombinations(""))
