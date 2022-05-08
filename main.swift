func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
    if nums.isEmpty { return [-1,-1] }
    var l:Int = 0
    var r:Int = nums.count-1
    
    func findTargetIndex() {
        while l < r {
            let m:Int = (l+r)/2
            if nums[l]...nums[m] ~= target {
                r = m
            }else {
                l = m+1
            }
        }
    }
    
    findTargetIndex()
    
    if nums[r] != target {
        return [-1,-1]
    }
    
    func findStartIndex() -> Int {
        var start = r-1
        while start > 0 {
            if nums[start] == target {
                start -= 1
                continue
            }
            break
        }
        return start+1
    }
    
    func findEndIndex() -> Int {
        var end = l+1
        while end < nums.count {
            if nums[end] == target {
                end += 1
                continue
            }
            break
        }
        return end-1
    }
    
    return [findStartIndex(),findEndIndex()]
}


print(searchRange([], 6))
