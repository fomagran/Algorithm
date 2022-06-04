/*
I'll make 3 arrays
 
 red white blue
 [0,0,0,0] [1,1,1] [2,2]
 return red + white + blue
 
 it takes O(n) time Complexity
 
 it also take O(n) space Complexity
 
 
 */

func sortColors(_ nums: inout [Int]) {
    
    var red:[Int] = []
    var white:[Int] = []
    var green:[Int] = []
    for i in 0..<nums.count {
        if nums[i] == 0 {
            red.append(0)
            continue
        }
        
        if nums[i] == 1 {
            white.append(1)
            continue
        }
        
        if nums[i] == 2 {
            green.append(2)
            continue
        }
    }
    
    nums = red + white + green
}


func sortColors2(_ nums: inout [Int]) {
    nums.sort{$0 < $1}
}
var nums =  [2,0,2,1,1,0]
print(sortColors(&nums),nums)

