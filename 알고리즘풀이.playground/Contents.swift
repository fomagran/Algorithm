import Foundation

func solution(_ a:Int, _ b:Int, _ g:[Int], _ s:[Int], _ w:[Int], _ t:[Int]) -> Int64 {
    var start:Int = 0
    var end:Int = Int(10e15)
    var answer:Int = end
    
    while start <= end {
        let mid:Int = (start + end)/2
        var gold:Int = 0
        var silver:Int = 0
        var total:Int = 0
        
        for i in 0..<s.count {
            var count = mid/(t[i]*2)
            
            if mid%(t[i]*2) >= t[i] {
                count += 1
            }
            gold += min(g[i],w[i] * count)
            silver += min(s[i],w[i] * count)
            total += min(g[i] + s[i],w[i] * count)
        }
        
        if gold >= a && silver >= b && total >= a+b {
            end = mid - 1
            answer = min(mid,answer)
        }else {
            start = mid + 1
        }
    }
    return Int64(answer)
}

solution(90, 500, [70,70,0], [0,0,500], [100,100,2], [4,8,1])
solution(10, 10, [100], [100], [7], [10])
