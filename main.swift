func trap(_ height: [Int]) -> Int {
    var answer:Int = 0
    var left:Int = 0
    var right:Int = height.count-1
    var leftMax:Int = 0
    var rightMax:Int = 0
    
    while left < right {
        leftMax = max(height[left],leftMax)
        rightMax = max(height[right],rightMax)
        
        if leftMax < rightMax {
            answer += leftMax - height[left]
            left += 1
        }else {
            answer += rightMax - height[right]
            right -= 1
        }
    }

    return answer
}

print(trap([0,1,0,2,1,0,1,3,2,1,2,1]))
