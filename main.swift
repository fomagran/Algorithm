func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var left: Int = 0
        var right: Int = numbers.count - 1
        
        while left < right {
            if numbers[left] + numbers[right] == target {
                break
            } else if numbers[left] + numbers[right] > target {
                right -= 1
            } else {
                left += 1
            }
        }
        
        return [left+1,right+1]
    }
    
    return []
}
