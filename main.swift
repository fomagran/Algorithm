func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
    var countDic: [Int:Int] = [:]
    
    for num in nums {
        countDic[num,default:0] += 1
    }
    
    var kSizeArr: [(Int,Int)] = Array(repeating: (-1,Int.min), count: k)
    
    for num in countDic {
        if kSizeArr.first!.1 >= num.value {
            continue
        }
        
        kSizeArr.removeFirst()
        
        if kSizeArr.isEmpty || kSizeArr.last!.1 <= num.value {
            kSizeArr.append((num.key,num.value))
            continue
        }
        
        var left: Int = 0
        var right: Int = kSizeArr.count - 1
        
        while left <= right {
            let mid = (left + right)/2
            let midValue = kSizeArr[mid].1
            
            if num.value == midValue {
                left = mid
                break
            } else if num.value < midValue {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        
        kSizeArr.insert((num.key,num.value), at: left)
    }
    
    return kSizeArr.map{$0.0}
}

print(topKFrequent([1,1,1,1,1,1,2,2,2,2,2,3,3,3,3,4,4,4,4,5,5,6,6,7,8],4))
