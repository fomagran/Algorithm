func largestRectangleArea(_ heights: [Int]) -> Int {
    var maxArea: Int = 0
    for i in 0..<heights.count {
        let current: Int = heights[i]
        var left = i-1
        var right = i+1
        
        while left >= 0 {
            if heights[left] < current {
                break
            }
            left -= 1
        }
        
        while right <= heights.count - 1 {
            if heights[right] < current {
                break
            }
            right += 1
        }
        
        left += 1
        right -= 1
        
        maxArea = max(maxArea,current*(right-left+1))
    }
    
    return maxArea
}

print(largestRectangleArea([3,4,5,6,5,5,7,4,1,2,3]))
print(largestRectangleArea([2,1,5,6,2,3]))
print(largestRectangleArea([2,4]))



/*
       7
    6  7
   56557
  4565574
 34565574  3
 34565574 23
 34565574123
 */
