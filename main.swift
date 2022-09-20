func findDuplicate(_ nums: [Int]) -> Int {
    var tortoise = 0
    var hare = 0
    
    while true{
        tortoise = nums[tortoise]
        hare = nums[nums[hare]]
        
        if tortoise == hare {
            break
        }
    }
    
    tortoise = 0
    
    while tortoise != hare {
        tortoise = nums[tortoise]
        hare = nums[hare]
        
        if tortoise == hare {
            break
        }
    }
    
    return tortoise
}
