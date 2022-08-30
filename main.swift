func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
    var stack = [Int]()
    var answer = [Int]()
    
    if k == 1 {
        return nums
    }
    
    for (i,num) in nums.enumerated() {
        if stack.isEmpty {
            stack.append(num)
            continue
        }
        
        if i >= k {
            let index = getIndexByBinarySearch(nums[i-k])
            stack.remove(at: index)
        }

        let index = getIndexByBinarySearch(nums[i])
        stack.insert(num,at:index)
        
        if stack.count == k {
            answer.append(stack.first!)
        }
    }
    
    func getIndexByBinarySearch(_ num: Int) -> Int {
        var left = 0
        var right = stack.count - 1
        
        while left <= right {
            let mid = (left+right)/2
            let midValue = stack[mid]
            
            if num == midValue {
                left = mid
                break
            } else if num < midValue {
                left = mid+1
            } else {
                right = mid-1
            }
        }
        
        return left
    }
    
    return answer
}

print(maxSlidingWindow([1,1], 1))
print(maxSlidingWindow([1,3,-1,-3,5,3,6,7], 3))
