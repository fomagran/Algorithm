func minWindow(_ s: String, _ t: String) -> String {
    if s.count < t.count {
        return ""
    }
    
    let sMap:[String] = s.map{String($0)}
    let tMap:[String] = t.map{String($0)}
    var sDic:[String:Int] = [:]
    var tDic:[String:Int] = [:]
    var minCount:Int = Int.max
    var minRange:(Int,Int) = (-1,-1)
    
    for c in sMap {
        sDic[c] = (sDic[c] ?? 0) + 1
    }
    
    for c in tMap {
        tDic[c] = (tDic[c] ?? 0) + 1
    }
    
    func findShortestSubstring(_ left:Int,_ right:Int,_ sDic:[String:Int]) {

        if left > right {
            return
        }
        
        let leftkey:String = sMap[left]
        let rightkey:String = sMap[right]
        
        if sDic[leftkey]! - 1 >= (tDic[leftkey] ?? 0) {
            var newDic = sDic
            newDic[leftkey]! -= 1
            if newDic[leftkey]! == 0 {
                newDic[leftkey] = nil
            }
            findShortestSubstring(left+1, right,newDic)
        }
    
        if sDic[rightkey]! - 1 >= (tDic[rightkey] ?? 0) {
            var newDic = sDic
            newDic[rightkey]! -= 1
            if newDic[rightkey]! == 0 {
                newDic[rightkey] = nil
            }
            findShortestSubstring(left, right-1,newDic)
        }
        
        if minCount > right-left+1{
//            if check(sDic)  {
                minCount = right-left+1
                minRange = (left,right)
//            }
        }
    }
    
    func check(_ dic:[String:Int]) -> Bool {
        for (key,value) in tDic {
            if dic[key] == nil {
                return false
            }
            
            if dic[key]! - value < 0 {
                return false
            }
        }
        return true
    }
    
    findShortestSubstring(0, s.count-1,sDic)
    
    return minRange.0 >= 0 ? sMap[minRange.0...minRange.1].joined() : ""
}



print(minWindow("cgklivwehljxrdzpfdqsapogwvjtvbzahjnsejwnuhmomlfsrvmrnczjzjevkdvroiluthhpqtffhlzyglrvorgnalk"
                ,"mqfff"))


