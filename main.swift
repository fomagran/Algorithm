/*
 search matrix's each row first value, last value
 if target is between first value and last value
 search above row's all element and if target < element stop for loop
 return false
 or meet the target value rreturn true
 */

func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
    for m in matrix {
        if m[0]...m[m.count-1] ~= target {
            
            var l:Int = 0
            var r:Int = m.count-1
            
            while l < r {
                let middle:Int = (l+r)/2
                if m[l]...m[middle] ~= target {
                    r = middle
                }else {
                    l = middle+1
                }
            }
            
            return m[l] == target
        }
    }
    return false
}



print(searchMatrix([[1,3]], 3))
