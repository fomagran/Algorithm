import Foundation

func solution(_ stones:[Int], _ k:Int) -> Int {
    
    return binarySearch(stones: stones,k: k)
}

func isCrossable(stones:[Int],k:Int) -> Bool {
    
    var counts = Array(repeating: 0, count: stones.count)
    
    for (i,stone) in stones.enumerated() {
        
        if stone < 1 {
            counts[i] = i == 0 ? 1 : counts[i-1] + 1
        }
        
        if counts[i] == k {
           return false
        }
    }
    
    return true
}

func binarySearch(stones:[Int],k:Int) -> Int {
    
    let sort = Set(stones).sorted()
    
    if stones.count == 1 { return stones.first! }
    
    var maxCount:Int = 0
    var min = 0
    var max = sort.count
    
    while min <= max {
        let mid = (min + max) / 2
        let newStones = stones.map{$0 - sort[mid]}
    
        if !isCrossable(stones: newStones, k: k) {
            maxCount = mid
            max = mid - 1
        } else {
            min = mid + 1
        }
    }

    return sort[maxCount]
}

solution([1,2,3], 1)




