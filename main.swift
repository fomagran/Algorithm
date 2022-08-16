func isValidSudoku(_ board: [[Character]]) -> Bool {
    var boxDic:[Int:[Character:Bool]] = [:]
    var vDic:[Int:[Character:Bool]] = [:]
    
    for i in 0..<9 {
        var hDic:[Character:Bool] = [:]
        for j in 0..<9 {
            let current = board[i][j]
            
            if current == "." {
                continue
            }
            
            let boxNum = i/3*3 + j/3
                        
            if boxDic[boxNum] == nil {
                boxDic[boxNum] = [current:true]
            } else {
                if boxDic[boxNum]![current] != nil {
                    return false
                } else {
                    boxDic[boxNum]![current] = true
                }
            }
            
            if vDic[j] == nil {
                vDic[j] = [current:true]
            } else {
                if vDic[j]![current] != nil {
                    return false
                } else {
                    vDic[j]![current] = true
                }
            }
            
            if hDic[current] != nil {
                return false
            } else {
                hDic[current] = true
            }
        }
    }
    
    return true
}

print(isValidSudoku([["5","3",".",".","7",".",".",".","."],["6",".",".","1","9","5",".",".","."],[".","9","8",".",".",".",".","6","."],["8",".",".",".","6",".",".",".","3"],["4",".",".","8",".","3",".",".","1"],["7",".",".",".","2",".",".",".","6"],[".","6",".",".",".",".","2","8","."],[".",".",".","4","1","9",".",".","5"],[".",".",".",".","8",".",".","7","9"]]))
