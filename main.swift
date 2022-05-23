//반드시 끝에 도달할 수 있도록 되어 있는가? (그렇지 않다면 무엇을 반환하는가?)
//시작할 땐 무조건 1칸 뛰는건가?


func jump(_ nums: [Int]) -> Int {
    var current:Int = nums.count - 1
    var count:Int = 0
    
    while current != 0 {
        for i in 0..<current{
            if nums[i] >= current-i {
                current = i
                count += 1
                break
            }
        }
    }
    
    return count
}


print(jump([2,3,1,1,4]))
