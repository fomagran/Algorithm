
import Foundation

func solution(_ n:Int, _ times:[Int]) -> Int64 {
    var willEndTimes = times.sorted(by: <).map {($0,$0)}
    for _ in 1...n {
        findMinWaitingTime(willEndTimes:&willEndTimes)
    }
    return Int64(willEndTimes.map{$0.1 - $0.0}.max()!)
}

func findMinWaitingTime(willEndTimes:inout [(Int,Int)]) {
    
    var first = willEndTimes.removeFirst()
    first = (first.0,first.1+first.0)
    
    let index = binarySearch(willEndTimes.map{$0.1},first.1)
    willEndTimes.insert(first, at: index)
}

func binarySearch(_ willEndTimes: [Int],_ endTime: Int) -> Int {

    if willEndTimes.count == 1 {return willEndTimes[0] >= endTime ? 0 : 1}
    if willEndTimes.first! >= endTime {return 0 }
    if endTime > willEndTimes.last! {return willEndTimes.count }

    var left = 0
    var right = willEndTimes.count

    while left < right {
        let middle = (left + right) / 2
        if willEndTimes[middle] >= endTime {
           right = middle
        }else{
            left =  middle + 1
        }
    }
    return left
}

solution(6, [1,2,3,7,10])
