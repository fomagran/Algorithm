func largestRectangleArea(_ heights: [Int]) -> Int {
    var maxArea: Int = 0
    var stack: [Int] = []
    let heights = heights + [0]
    
    for (i,height) in heights.enumerated() {
        let current: Int = height
        
        while !stack.isEmpty && current <= heights[stack.last!] {
            let last = stack.removeLast()
            let lastHeight = heights[last]
            let area = lastHeight * (i - (stack.last ?? -1) - 1)
            maxArea = max(maxArea,area)
        }
        stack.append(i)
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
