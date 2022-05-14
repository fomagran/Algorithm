func searchInsert(_ nums: [Int], _ target: Int) -> Int {
    for (i,n) in nums.enumerated() {
        if n >= target {
            return i
        }
    }
    return nums.count
}
