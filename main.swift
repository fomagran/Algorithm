func canJump(_ nums: [Int]) -> Bool {
    var from:Int = nums.count-1
    
    while from > 0 {
        var check:Bool = false
        for i in stride(from: from-1, through: 0, by: -1){
            if nums[i] >= from - i{
                check = true
                from = i
            }
        }
        if !check {
            return false
        }
    }
    return true
}

print(canJump([0]))
