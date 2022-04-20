
func maxArea(_ height: [Int]) -> Int {
    var most:Int = 0
    var start:Int = 0
    var end:Int = height.count - 1
    
    while start < end {
        let w = end - start
        let h = min(height[start],height[end])
        most = max(most,w*h)
        if height[start] > height[end]  {
            end -= 1
        }else {
            start += 1
        }
    }
    return most
}

print(maxArea([1,8,6,2,5,4,8,3,7]))
