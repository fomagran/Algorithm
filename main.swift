func uniquePaths(_ m: Int, _ n: Int) -> Int {
    if m == 1 || n == 1 {
        return 1
    }
    let bigger:Int = m > n ? m-1 : n-1
    let less:Int = m > n ? n : m
    var paths:[[Int]] = [(1...less).map{$0}]
    
    for i in 1..<bigger {
        var newPath:[Int] = [1]
        let prev:[Int] = paths[i-1]
        for j in 1..<less {
            newPath.append(newPath[j-1] + prev[j])
        }
        paths.append(newPath)
    }
    
    return paths[bigger-1][less-1]
}

//1
//1 2 3 4 5
//1 3 6 10 15
//1 4 10 20 35
//1 5 15 35 70
//1 6 21 56 126
//1 7 28 84 210
//1 8 36 120 330

//5 10 15 35 70


print(uniquePaths(1,1))
