


func solveNQueens(_ n: Int) -> [[String]] {
    
    var answer:[[String]] = []
    let nDots:[String] = Array(repeating: ".", count: n)
    let nChecked:[Bool] = Array(repeating:false, count: n)
    
    func dfs(_ depth:Int,_ current:[[String]],_ enable:[[Bool]]) {
        if depth == n {
            answer.append(current.map{$0.joined()})
            return
        }
        
        for x in 0..<n {
            if enable[depth][x] {
                var newEnable = enable
                for y in 0..<n {
                    newEnable[y][x] = false
                    if y == depth {
                        newEnable[y] = nChecked
                    }
                    if x-abs(depth-y) >= 0 {
                        newEnable[y][x-abs(depth-y)] = false
                    }
                    
                    if x+(abs(depth-y)) < n {
                        newEnable[y][x+(abs(depth-y))] = false
                    }
                }
                var newDots = nDots
                newDots[x] = "Q"
                dfs(depth+1,current + [newDots], newEnable)
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

