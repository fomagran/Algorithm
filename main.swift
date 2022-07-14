func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
    var quickArray:[Int] = nums
    var K = nums.count - k
    
    func quickSelect(_ l:Int,_ r:Int) -> Int {
        let pivot:Int = quickArray[r]
        var p:Int = l
        
        for i in l..<r {
            if quickArray[i] <= pivot {
                quickArray.swapAt(p,i)
                p += 1
            }
        }
        
        quickArray.swapAt(p,r)

        if p == K {
            return quickArray[p]
        }else if p > K {
            return quickSelect(l,p-1)
        }else {
            return quickSelect(p+1,r)
        }
    }

    return quickSelect(0,nums.count-1)
}
