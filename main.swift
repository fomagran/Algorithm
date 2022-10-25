func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
    var sortedNums = [Int]()

    for num in nums {
        if sortedNums.isEmpty {
            sortedNums.append(num)
            continue
        }
        
        var left = 0
        var right = sortedNums.count - 1
        
        while left <= right {
            let mid = (left + right)/2
        
            if sortedNums[mid] == num {
                left = mid
                break
            } else if sortedNums[mid] > num {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        
        sortedNums.insert(num,at:left)
    }
    
    return sortedNums[k-1]

}
