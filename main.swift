/*
 matrix wrap
 prevent to x < 0 or x > matrix.count
 or y < 0 or y > matrix.count
 -----
 |    |
 |    |
 |    |
 |    |
 |    |
 ------
 if matrix[y][x] == 0 {
    matrix[y-1][x] = 0
    matrix[y][x-1] = 0
    matrix[y+1][x] = 0
    matrix[y][x+1] = 0
 }
 
 if matrix[x][y] == 0 {
    matrix[y-1][x] = 0
    matrix[y][x-1] = 0
    matrix[y+1][x] = 0
    matrix[y][x+1] = 0
 }
 
 */


func setZeroes(_ matrix: inout [[Int]]) {
    let matrixCopy:[[Int]] = matrix
    for y in 0..<matrix.count {
        for x in 0..<matrix[0].count {
            if matrixCopy[y][x] == 0 {
                changeAllRow(x)
                changeAllColumn(y)
            }
        }
    }
    
    func changeAllRow(_ x:Int) {
        for i in 0..<matrix.count {
            matrix[i][x] = 0
        }
    }

    func changeAllColumn(_ y:Int) {
        for i in 0..<matrix[0].count {
            matrix[y][i] = 0
        }
    }
}



var matrix:[[Int]] = [[0,1,2,0],[3,4,5,2],[1,3,1,5]]
print(setZeroes(&matrix),matrix)



