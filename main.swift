func replaceElements(_ arr: [Int]) -> [Int] {
    var result = arr
    var current = 0
    
    while current < arr.count-1 {
        var maxIndex = current+1
        
        for i in current+1..<arr.count {
            if arr[maxIndex] < arr[i] {
                maxIndex = i
            }
        }
        
        for i in current..<maxIndex {
            result[i] = arr[maxIndex]
        }
        
        current = maxIndex
    }
    
    result[arr.count-1] = -1
    
    return result
}


print(replaceElements([17,18,5,4,6,1]))
