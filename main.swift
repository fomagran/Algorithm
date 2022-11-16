class MedianFinder {
    private var nums = [Int]()
    
    func addNum(_ num: Int) {
        var left = 0
        var right = nums.count - 1
        
        while left <= right {
            let mid = (left + right)/2
            
            if nums[mid] == num {
                left = mid + 1
                break
            } else if nums[mid] < num {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        
        nums.insert(num,at: left)
    }
    
    func findMedian() -> Double {
        return nums.count%2 == 1 ? Double(nums[nums.count/2]) : Double(nums[nums.count/2-1] + nums[nums.count/2])/2
    }
}
