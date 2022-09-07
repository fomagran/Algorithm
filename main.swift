func search(_ nums: [Int], _ target: Int) -> Int {
    var left = 0
    var right = nums.count - 1
    
    while left <= right {
        let mid = (left + right)/2
        
        if nums[mid] == target {
            left = mid
            break
        } else if nums[mid] < target {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    
    return nums[min(left,nums.count-1)] == target ? left : -1
}

print(search([-1,0,3,5,9,12], 13))
