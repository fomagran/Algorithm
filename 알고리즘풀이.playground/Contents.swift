import Foundation

func solution(_ n:Int, _ weak:[Int], _ dist:[Int]) -> Int {
    var weaks:[Set<[Int]>] = [[weak]]
    for (friendCount,d) in dist.reversed().enumerated() {
        var newWeaks:Set<[Int]> = []
        for w in weaks.first! {
            for start in w {
                let end = (n+(start-d))%n
                let filterWeaks = start > end ? w.filter{$0 < end || start+1...n ~= $0 } : w.filter{ start+1..<end ~= $0 }
                if filterWeaks.isEmpty { return friendCount+1 }
                newWeaks.insert(filterWeaks)
            }
        }
        weaks[0] = newWeaks
    }
    return -1
}

//solution(12,[1, 5, 6, 10],[1,2,3,4])
solution(12,[1, 3, 4, 9, 10],[3, 5, 7])
