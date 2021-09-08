import Foundation

struct Weak {
    let dist:[Int]
    let weak:[Int]
    let current:Int
    let count:Int
}

var answer:Int = Int.max
var distCount:Int = 0
var N:Int = 0

func solution(_ n:Int, _ weak:[Int], _ dist:[Int]) -> Int {
    distCount = dist.count
    N = n
    var reverseDist = Array(dist.reversed())
    let first = reverseDist.removeFirst()
    dfs(w: Weak(dist: reverseDist, weak: weak, current: first, count: 0))
    return answer == Int.max ? -1 : answer
}

func dfs(w:Weak) {
    if w.count >= answer { return }
    if w.dist.isEmpty { return }
    if w.weak.isEmpty {
        answer = min(answer,w.count+1)
        return
    }
    var newDist = w.dist
    let dist = newDist.removeFirst()
    
    for n in w.weak {
        var filterClock:[Int] = []
        if n < (n+w.current)%N {
            filterClock = w.weak.filter{$0 < n || (n+w.current)%N+1...N ~= $0 }
        }else {
            filterClock = w.weak.filter{(n+w.current)%N+1..<n ~= $0 }
        }
        dfs(w: Weak(dist: newDist, weak: filterClock, current: dist, count: w.count + 1))
        var filterAntiClock:[Int] = []
        let other = (N+(n-w.current))%N
        if n > (N+(n-w.current))%N {
            filterAntiClock = w.weak.filter{$0 < other || n+1...N ~= $0 }
        }else {
            filterAntiClock = w.weak.filter{ n+1..<other ~= $0 }
        }
        dfs(w: Weak(dist: newDist, weak: filterAntiClock, current: dist, count: w.count + 1))
    }
}

solution(12,[1, 3, 4, 9, 10],[3, 5, 7])
//solution(12,[1, 5, 6, 10],[1,2,3,4])
