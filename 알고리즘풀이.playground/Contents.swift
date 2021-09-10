import Foundation

func solution(_ n:Int, _ stations:[Int], _ w:Int) -> Int{
    let W = w*2+1
    var baseStationCount:Int = 0
    var start:Int = 1
    for station in stations {
        let end = station-(w+1)
        if end <= 0 {
            start = station + w + 1
            continue
        }
        baseStationCount += Int(ceil(Double(end - start + 1)/Double(W)))
        start = station + w + 1
    }
    if start <= n {
        baseStationCount += Int(ceil(Double(n - start + 1)/Double(W)))
    }
    return baseStationCount
}

solution(11, [4,11], 1)
solution(16, [9], 2)
solution(19, [2,6,10,14,18], 1)
solution(19, [2,4,6,11,13], 1)


