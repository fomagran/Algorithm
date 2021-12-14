func solution(_ food_times:[Int], _ k:Int64) -> Int {
    var foodDic:[Int:Int] = [:]
    var K = Int(k)
    var numberCount:[Int:Int] = [:]
    for (i,food) in food_times.enumerated() {
        foodDic[i+1] = food
        if numberCount[food] == nil {
            numberCount[food] = 1
        }else {
            numberCount[food]! += 1
        }
    }
    
    let sort = foodDic.sorted{$0.value < $1.value}
    var last:Int = 0
    var foodCount:Int = food_times.count
    var index:Int = 0
    
    while index < sort.count {
        let first = sort[index].value
        K -= foodCount * (first-last)
        if K < 0 {
            K += foodCount * (first-last)
            let filter = sort[index...].sorted{$0.key < $1.key}
            return filter[K%foodCount].key
        }
        foodCount -= numberCount[first]!
        last = first
        index += numberCount[first]!
    }
    return -1
}

solution([3, 1, 2], 5)
solution([4,2,3,6,7,1,5,8], 27)
solution([4,2,3,6,7,1,5,8], 16)
