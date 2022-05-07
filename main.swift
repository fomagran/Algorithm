func search(_ nums: [Int], _ target: Int) -> Int {
    var l:Int = 0
    var r:Int = nums.count-1
    
    while l < r {
        let m:Int = (l+r)/2
        if nums[l] > nums[m] {
            if nums[l] <= target || nums[m] >= target {
                r = m
                continue
            }
        }else {
            if nums[l]...nums[m] ~= target {
                r = m
                continue
            }
        }
        
        if nums[r] > nums[m+1] {
            if nums[m+1]...nums[r] ~= target {
                l = m+1
                continue
            }
        }else {
            if nums[r] <= target || nums[m+1] >= target {
                l = m+1
                continue
            }
        }
        return -1
    }
    return nums[r] == target ? r : -1
}


print(search([5,1,3],3))
