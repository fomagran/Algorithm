func moveZeroes(_ nums: inout [Int]) {
    var current = 0
    
    for i in 0..<nums.count {
        if nums[current] == 0 {
            nums.remove(at: current)
            nums.append(0)
            continue
        }
        current += 1
    }
}
