func findMin(_ nums: [Int]) -> Int {
    var left = 0
    var right = nums.count - 1
    
    while left < right {
        let mid = (left + right)/2
        
        if nums[mid] < nums[right] {
            right = mid
        }  else {
            left = mid + 1
        }
    }
    
    return nums[left]
}

print(findMin([3,4,5,1,2]))
print(findMin([4,5,6,7,0,1,2]))
print(findMin([11,13,15,17]))
print(findMin([1]))
print(findMin([3,1,2]))
