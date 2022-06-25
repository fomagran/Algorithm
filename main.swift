


func solveNQueens(_ n: Int) -> [[String]] {
    
    var answer:[[String]] = []
    let nDots:[String] = Array(repeating: ".", count: n)
    
    func dfs(_ depth:Int,_ current:[String],_ enable:[[Bool]]) {
        if depth == n {
            answer.append(current)
            return
        }
        
        for i in 0..<n {
            if enable[depth][i] {
                var newEnable = enable
                for j in 0..<n {
                    newEnable[j][i] = false
                    if j == depth {
                        let allChecked = Array(repeating:false, count: n)
                        newEnable[j] = allChecked
                    }
                    if i-abs(depth-j) >= 0 {
                        newEnable[j][i-abs(depth-j)] = false
                    }
                    
                    if i+(abs(depth-j)) < n {
                        newEnable[j][i+(abs(depth-j))] = false
                    }
                }
                var newCurrent = current
                var newDots = nDots
                newDots[i] = "Q"
                newCurrent.append(newDots.joined())
                dfs(depth+1,newCurrent, newEnable)
            }
        }
    }
    
    let initEnable:[[Bool]] = Array(repeating:Array(repeating:true, count: n), count: n)
    dfs(0, [], initEnable)
    
    return answer
}

print((solveNQueens(4)))

            
/*
 .Q..
 ...Q
 Q...
 ..Q.
 
 ..Q.
 Q...
 ...Q
 .Q..
 
 ...Q
 .Q..
 Q...
 ..Q.
 
 */

