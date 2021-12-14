func solution(_ food_times:[Int], _ k:Int64) -> Int {
    guard food_times.reduce(0, +) > k else {
        return -1
    }
    
    let food = food_times.enumerated().map{($0.offset,$0.element)}
    var K = Int(k)
    
    let sort = food.sorted{$0.1 < $1.1}
    var last:Int = 0
    var index:Int = 0
    var foodCount = food_times.count
    
    while index < sort.count {
        let first = sort[index].1
        var max = foodCount * (first-last)
        var numberCount = 0
        for i in index..<sort.count {
            if sort[i].1 == first {
                numberCount += 1
            }else {
                break
            }
        }
        if K-max < 0 { break}
        K -= max
        foodCount -= numberCount
        last = first
        index += numberCount
    }
    
    let filter = sort[index...].sorted{$0.0 < $1.0}
    return filter[K%foodCount].0 + 1
}

solution( [1,1,1,1], 4)
solution([3, 1, 2], 5)
solution([4,2,3,6,7,1,5,8], 27)
solution([4,2,3,6,7,1,5,8], 16)
