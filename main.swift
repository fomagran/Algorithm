struct Sequence {
    var head: Int
    var tail: Int
    var length: Int {
        return abs(tail - head + 1)
    }
}

func longestConsecutive(_ nums: [Int]) -> Int {
    var sequences: [Int:Sequence] = [:]
    var maxLength: Int = 0
    
    for n in nums {
        
        if sequences[n] != nil {
            continue
        }
        
        if sequences[n-1] == nil && sequences[n+1] == nil {
            sequences[n] = Sequence(head: n, tail: n)
        }
        
        if sequences[n-1] != nil && sequences[n+1] != nil {
            sequences[n] = Sequence(head: sequences[n-1]!.head, tail: sequences[n+1]!.tail)
            let head = sequences[n-1]!.head
            let tail = sequences[n+1]!.tail
            sequences[tail]!.head = head
            sequences[head]!.tail = tail
        }
        
        if sequences[n-1] != nil && sequences[n+1] == nil {
            sequences[n] = Sequence(head: sequences[n-1]!.head, tail: n)
            let head = sequences[n-1]!.head
            sequences[head]!.tail = n
        }
        
        if sequences[n+1] != nil && sequences[n-1] == nil {
            sequences[n] = Sequence(head: n, tail: sequences[n+1]!.tail)
            let tail = sequences[n+1]!.tail
            sequences[tail]!.head = n
        }

        maxLength = max(maxLength,sequences[n]!.length)
    }
    
    return maxLength
}

print(longestConsecutive([-4,-1,4,-5,1,-6,9,-6,0,2,2,7,0,9,-3,8,9,-2,-6,5,0,3,4,-2]))

//-4
//-4 -1
//-4 -1 4
//-5-4 -1 4
//-5-4 -1 1 4
//-6-5-4 -1 1 4
//-6-5-4 -1 1 4 9
//-6-5-4 -1 1 4 9
//-6-5-4 -101 4 9
//-6-5-4 -1012 4 9
//-6-5-4 -1012 4 7 9
//-6-5-4 -1012 4 7 9
//-6-5-4-3 -1012 4 7 9
//-6-5-4-3 -1012 4 789
//-6-5-4-3-2-1012 4 7 9
//-6-5-4-3-2-1012 45 7 9
//-6-5-4-3-2-1012345 7 9
