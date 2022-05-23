//func rotate(_ matrix: inout [[Int]]) {
//    for (i,mat) in matrix.enumerated() {
//        let col:Int = matrix.count-1-i
//        for (j,m) in mat.enumerated(){
//            matrix[j][col] = m
//        }
//    }
//}

func rotate(_ matrix: inout [[Int]]) {
    let matrixCopy = matrix
    for i in 0..<matrixCopy.count {
        matrix[i] = matrixCopy.map{$0[i]}.reversed()
    }
}

var m = [[1,2,3],[4,5,6],[7,8,9]]

rotate(&m)
