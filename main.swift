func largestRectangleArea(_ heights: [Int]) -> Int {
    var maxArea: Int = 0
    for i in 0..<heights.count {
        let current: Int = heights[i]
        var area: Int = 0
        for j in i..<heights.count {
            let compare: Int = heights[j]
            if compare < current {
                break
            }else {
                area += current
            }
            maxArea = max(maxArea,area)
        }
    }
    
    return maxArea
}

print(largestRectangleArea([2,1,5,6,2,3]))




/*
       7
    6  7
   56557
  4565574
 34565574  3
 34565574 23
 34565574123
 */
