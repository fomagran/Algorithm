func maxArea(_ height: [Int]) -> Int {
    var most:Int = 0
    for (i,h) in height.enumerated() {
        for j in 0..<i {
            let width = i - j
            let height = min(h,height[j])
            most = max(most,width*height)
        }
    }
    return most
}

print(maxArea([1,1]))
