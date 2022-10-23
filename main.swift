class KthLargest {
    var sortedNums = [Int]()
    var k = 0
    
    init(_ k: Int, _ nums: [Int]) {
        self.k = k
        self.sortedNums = nums.sorted{$0 > $1}
    }
    
    func add(_ val: Int) -> Int {
        var left = 0
        var right = sortedNums.count - 1
        
        while left <= right {
            let mid = (left + right)/2
            
            if sortedNums[mid] == val {
                left = mid
                break
            } else if sortedNums[mid] > val {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        
        sortedNums.insert(val, at: left)
        return sortedNums[k-1]
    }
}

let a = KthLargest(1, [])
a.add(3)
a.add(5)
a.add(10)
a.add(9)
a.add(4)
