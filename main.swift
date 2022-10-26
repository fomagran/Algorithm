func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
    var sortedNums = nums
    return quickSelect(&sortedNums,nums.count - k,0,nums.count - 1)
}

func quickSelect(_ nums: inout [Int],_ k: Int, _ start: Int, _ end: Int) -> Int {
    var p = start

    for i in start..<end {
        if nums[i] <= nums[end] {
            nums.swapAt(i,p)
            p += 1
        }
    }
    
    nums.swapAt(p,end)

    if p < k {
        quickSelect(&nums,k,p+1,nums.count-1)
    } else if p > k {
        quickSelect(&nums,k,start,p-1)
    }

    return nums[k]
}
