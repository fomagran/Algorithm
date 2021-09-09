import Foundation

func solution(_ n:Int, _ stations:[Int], _ w:Int) -> Int{
    let W = w*2+1
    var baseStationCount:Int = n/W
    var remainder:Int = n%W
    var gap = 0
    
    for station in stations {
        if station/W == 0 {
            baseStationCount -= 1
            continue
        }
        let end = W * (station/W + 1)
        let middle = end-2
        if n - remainder < middle {
            remainder += -W
        }else {
            remainder +=  middle - station
        }
    }
    
    let plusOrMinus:Int = remainder > 0 ? 1 : 0
        
    return baseStationCount + remainder/W + plusOrMinus
}

solution(16, [9], 2)
