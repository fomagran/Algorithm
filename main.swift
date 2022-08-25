import Foundation

func solution(_ alp:Int, _ cop:Int, _ problems:[[Int]]) -> Int {
    var sortedProblems: [[Int]] = problems.sorted{max($0[0],$0[1]) < max($1[0],$1[1])}
    sortedProblems.insert([1,1,1,1,100], at: 0)
    var currentAlp: Int = alp
    var currentCop: Int = cop
    var answer: Int = 0
    
    for i in 0..<problems.count {
        let nextProblem = sortedProblems[i+1]
        var minTime = Int.max
        for j in 0...i {
            let canSolveMinTime = getMinTime(sortedProblems[j], nextProblem)
            if minTime > canSolveMinTime{
                minTime = canSolveMinTime
            }
        }
        
        currentAlp = max(currentAlp,nextProblem[0])
        currentCop = max(currentCop,nextProblem[1])
        answer += minTime
    }
    
    func getMinTime(_ current:[Int],_ next:[Int]) -> Int {
        let lackOfAlp: Int = next[0] - currentAlp
        let lackOfCop: Int = next[1] - currentCop
        
        //case 1 문제 안풀고 늘리기
        let bothTime: Int = lackOfAlp + lackOfCop
        
        //case 2 알고력 문제로 코딩력 시간으로
        let onlyAlp = lackOfAlp > 0 ? lackOfAlp/current[2] * current[4] + lackOfCop : lackOfCop
        
        //case 3 알고력 시간으로 코딩력 문제로
        let onlyCop = lackOfCop > 0 ? lackOfCop/current[3] * current[4] + lackOfAlp : lackOfAlp
        
        //case 4 코딩력 알고력 모두 문제로
        var bothProblem = onlyAlp - lackOfCop
        let lackOfCop2 = lackOfCop - current[3] * lackOfAlp/current[2]
        if lackOfCop2 > 0 {
            bothProblem += lackOfCop2/current[3] * current[4]
        }
        
        return min(bothTime,onlyAlp,onlyCop,bothProblem)
    }
    
    return answer
}


print(solution(10, 10, [[10,15,2,1,2],[20,20,3,3,4]]))
print(solution(0, 0, [[0,0,2,1,2],[4,5,3,1,2],[4,11,4,0,2],[10,4,0,4,2]]))
