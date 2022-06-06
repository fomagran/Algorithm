/*
 find the word's first letter in board
 start to move all direction(left,right,down,up)
 create currentString, which is collecting visit character
 
 prevent to infinite loop, confirm already visit position
 
 if currentString is word, return true
 else if current index charater is not equal word index character stop moving
 else currentString count is bigger or equal word count stop moving
 */

//inout visit을 사용해서 일일이 만들지 말고 사용하고 다시 원상태로 복귀하는 방법을 쓰면 훨씬 빠르다.

func exist(_ board: [[Character]], _ word: String) -> Bool {
    
    guard board.count != 0, board[0].count != 0, word.count != 0 else { return false }

    let rows = board.count, cols = board[0].count
    let w = word.map{$0}
    
    var visit:[[Bool]] = Array(repeating:Array(repeating:false, count: board[0].count),count:board.count)
    
    for i in 0..<rows {
        for j in 0..<cols where board[i][j] == word.first {
            if dfs(x: j, y: i,count: 0, visit: &visit) {
                return true
            }
        }
    }
    
    func dfs(x:Int,y:Int,count:Int,visit:inout [[Bool]]) -> Bool {
        //word.count로 했을 경우 3000ms 넘음, array를 counting해주면 100ms대로 됨
        guard count < w.count else { return true }
        
        guard   y >= 0,
                y < board.count,
                x >= 0,
                x < board[0].count,
                !visit[y][x],
                board[y][x] == w[count]
        else { return false }
        
        visit[y][x] = true
        
        let check =  dfs(x:x-1, y: y,count: count+1, visit:&visit) ||
                    dfs(x: x+1, y: y, count: count+1, visit:&visit) ||
                dfs(x: x, y: y-1, count: count+1, visit:&visit) ||
                dfs(x: x, y: y+1, count: count+1, visit:&visit)
        
        visit[y][x] = false
        
        return check
    }

    return false
}

print(exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]]
            ,"ABCCED"))
