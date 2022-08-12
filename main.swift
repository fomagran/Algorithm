func productExceptSelf(_ nums: [Int]) -> [Int] {
    var answer: [Int] = []
    var product: Int = 1
    var zeroCount: Int = 0
    
    for num in nums {
        if num == 0 {
            zeroCount += 1
            if zeroCount == 2 {
                return Array(repeating: 0, count: nums.count)
            }
            continue
        }
        product *= num
    }
    
    for num in nums {
        if zeroCount == 1 {
            answer.append(num == 0 ? product : 0)
        } else {
            answer.append(product/num)
        }
    }

   return answer
}

print(productExceptSelf([-1,1,0,-3,3]))
