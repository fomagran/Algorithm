func solution(_ a:[Int]) -> Int {
    var subDic:[Int:[Int]] = [:]
    if a.count == 1 { return 0}

    subDic[a.first!] = Array(a[0...1])
    var previous:Int = a[0]

    
    for i in 1..<a.count {
        let n:Int = a[i]
        if subDic[n] == nil {
            subDic[n] = Array(a[i-1...i])
        }else {
            if previous != n {
                subDic[n]!.append(contentsOf:a[i-1...i])
            }
        }
        if previous == n {
            previous = -1
        }else {
            previous = n
        }
    }
    return subDic.sorted{$0.value.count > $1.value.count}.first?.value.count ?? 0
}

solution([0])
solution([0,1,1,0,0,0])
solution([5,2,3,3,5,3])
solution([0,3,3,0,7,2,0,2,2,0])
