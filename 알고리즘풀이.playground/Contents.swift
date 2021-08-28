import Foundation

func solution(_ n:Int) -> Int {
    //가능한 배치 수
    var answer:Int = 0
    //퀸이 놓인 위치를 기억할 2차원 배열
    let history = Array(repeating: Array(repeating: true, count: n), count: n)
    //가능한 배치를 찾는다
    findEnableArrange(n: n, depth: 0,history:history,answer:&answer)
    return answer
}

func findEnableArrange(n:Int,depth:Int,history:[[Bool]],answer:inout Int) {
    //가장 마지막까지 왔을 경우
    if depth == n {
        //배치 가능한 것이므로 +1 해줌
        answer += 1
        return
    }
    //현재 행에 퀸을 놓을 수 있는지 확인
    for x in 0..<n {
        //공격하지 못한다면
        if isUnableAttack(history: history, x: x, y:depth) {
            var newHistory = history
            newHistory[depth][x] = false
            //dfs로 진행
            findEnableArrange(n: n, depth: depth+1,history: newHistory,answer: &answer)
        }
    }
}
//공격이 불가능한지 체크한다
func isUnableAttack(history:[[Bool]],x:Int,y:Int) -> Bool {
    for i in 0..<history.count {
        //세로 확인
        if !history[i][x]  {
            return false
        //대각선으로 왼쪽 확인
        }else if 0..<history.count ~= x-abs(y-i) && !history[i][x-abs(y-i)] {
            return false
        //대각선으로 오른쪽 확인
        }else if 0..<history.count ~= x+abs(y-i) && !history[i][x+abs(y-i)] {
            return false
        }
    }
    return true
}


solution(4)
