func solution(_ food_times:[Int], _ k:Int64) -> Int {
    if food_times.reduce(0,+) <= k { return -1 }
    var K = Int(k)
    var foods = food_times.enumerated().sorted{$0.element > $1.element}
    var last:Int = 0
    while K - foods.count * (foods.last!.element - last) >= 0{
        let min = foods.removeLast().element
        K -= (foods.count+1) * (min-last)
        last = min
    }
    return foods.sorted{$0.offset < $1.offset}[K%foods.count].offset + 1
}



//solution( [1,1,1,1], 4)
solution([3, 1, 2], 5)
solution([4,2,3,6,7,1,5,8], 27)
solution([4,2,3,6,7,1,5,8], 16)
