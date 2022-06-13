/*
 1. sort the nums
 2. use 2 pointer (start left index is a 0 index, right index is nums.count -1
 3. if target - (leftindex num + right index num) < 0
 that means sum should be less, so make the middle point and iterate left + 1..<num.count-1 find closest sum, if the sum has far from the closest then break
 4. if target - (leftindex num + right index num) > 0
 that means sum should be large, so make the middle point and iterate nums.count ... 1 find closest sum, if the sum has far from the closest then break
 5. if the middle point itreate is done, if 3 case right index - 1, if 4 case left index + 1
 
 if the gap between target and closest value is 0, we gonna return target
 
 */


func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
    let sorted = nums.sorted(by: <)
    var closest:Int = target < 0 ? Int.min : Int.max
    
    for i in 0..<nums.count {
        let leftValue:Int = sorted[i]
        var right:Int = nums.count - 1
        var middle:Int = i+1
        while middle < right {
            let rightValue = sorted[right]
            let middleValue = sorted[middle]
            let sum = leftValue+rightValue+middleValue
            
            if abs(target-closest) > abs(target-sum) {
                closest = sum
            }
            
            if sum <= target {
                middle += 1
            } else {
                right -= 1
            }
        }
    }
    
    return closest
}

print(threeSumClosest([-55,-24,-18,-11,-7,-3,4,5,6,9,11,23,33]
                      ,0))
