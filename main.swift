/*
 Idea: first a,b,c,d
 a index = 0
 b index = 1(0+1)
 c index = nums.count-2
 d index = nums.count -1
 
 4 sum is a + b + c + d
 a,c,d is fix
 2) b is goint to increase + 1
 like this 0 1 nums.count -2 nums.count -1
 and 0 2 nums.count-2 nums.count - 1....
 
 if b is c -1 , then c is goint to decrease -1
 and b is going to 2)
 and if c == a+1
 then a+1
 
 whie this is proceeding, if a+b+c+d is the target
 append answer a,b,c,d
 
 Time complexity O(n^3)
 Space complexity O(1)
 
 */

func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
    if nums.count < 4 { return [] }
    if nums.count == 4 { return nums.reduce(0,+) == target ? [nums] : [] }
    let sorted = nums.sorted(by: <)
    var result:[[Int]] = []
    
    for a in 0..<nums.count {
        for b in a+1..<nums.count {
            for c in b+1..<nums.count {
                for d in c+1..<nums.count {
                    let sum = sorted[a] + sorted[b] + sorted[c] + sorted[d]
                    if sum == target {
                        result.append([sorted[a],sorted[b],sorted[c],sorted[d]])
                        break
                    }
                    
                    if sum > target {
                        break
                    }
                }
            }
        }
    }
    
    return result
}

print(fourSum([1,0,-1,0,-2,2], 0))
