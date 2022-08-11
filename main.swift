func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
    var countDic: [Int:Int] = [:]
    
    for num in nums {
        countDic[num,default:0] += 1
    }
    
    return Array(countDic.sorted{$0.value > $1.value}.map{$0.key}[0..<k])
}

print(topKFrequent([1,1,1,2,2,3],1))
