func minPathSum(_ grid: [[Int]]) -> Int {
    var gridCopy:[[Int]] = grid
    let m:Int = grid.count-1
    let n:Int = grid[0].count-1
    
    for i in 0...m {
        for j in 0...n {
            
            var current = gridCopy[i][j]
            
            if i > 0 && j > 0 {
                current += min(gridCopy[i-1][j],gridCopy[i][j-1])
            }else if i > 0 && j == 0 {
                current += gridCopy[i-1][j]
            }else if j > 0 && i == 0 {
                current += gridCopy[i][j-1]
            }
            
            gridCopy[i][j] = current
        }
    }
    
    return gridCopy[m][n]
}
