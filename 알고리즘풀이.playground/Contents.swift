import Foundation

/*
 새로운 숫자가 나올 때마다 딕셔너리에 바로 앞 숫자와 저장한다.
 만약 있는 숫자라면 딕셔너리 배열에 추가해준다.
 */

func solution(_ a:[Int]) -> Int {
    var subDic:[Int:[Int]] = [:]
    var previous:Int = -1
    
    for i in 0..<a.count-1 {
        let n:Int = a[i]
        if subDic[n] == nil {
            subDic[n] = Array(a[i...i+1])
        }else {
            if previous != n {
                subDic[n]!.append(contentsOf:a[i...i+1])
            }
        }
        previous = n
    }
    
    let n:Int = a[a.count-1]
    if a.count > 1 && subDic[n] == nil {
        subDic[n] = Array(a[a.count-2...a.count-1])
    }else {
        if a.count > 2 && a[a.count-3] != n && a[a.count-2] != n {
            subDic[n]!.append(contentsOf:a[a.count-2...a.count-1])
        }
    }

    return subDic.sorted{$0.value.count > $1.value.count}.first?.value.count ?? 0
}

solution([0])
solution([5,2,3,3,5,3])
solution([0,3,3,0,7,2,0,2,2,0])
