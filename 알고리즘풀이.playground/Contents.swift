import Foundation

func solution(_ board:[[Int]], _ skill:[[Int]]) -> Int {
    var answer = 0
    var b = board
    var visit:[[Bool]] = Array(repeating: Array(repeating: false, count: board[0].count), count: board.count)

    for (y,row) in b.enumerated() {
        for (x,col) in row.enumerated() {
            if col > 0 {
                if !visit[y][x] {
                    answer += 1
                }
                visit[y][x] = true
            }else {
                if visit[y][x] {
                    answer -= 1
                }
                visit[y][x] = false
            }
        }
    }

    for s in skill {
        let p = s[0] == 1 ? -s[5] : s[5]
        for y in s[2]...s[4] {
            for x in s[1]...s[3] {
                b[x][y] += p
                if b[x][y] > 0 {
                    if !visit[x][y] {
                        answer += 1
                    }
                    visit[x][y] = true
                }else {
                    if visit[x][y] {
                        answer -= 1
                    }
                    visit[x][y] = false
                }
            }
        }
    }
    return answer
}

solution([[1,2,3],[4,5,6],[7,8,9]], [[1,1,1,2,2,4],[1,0,0,1,1,2],[2,2,0,2,0,100]])
solution([[5,5,5,5,5],[5,5,5,5,5],[5,5,5,5,5],[5,5,5,5,5]],     [[1,0,0,3,4,4],[1,2,0,2,3,2],[2,1,0,3,1,2],[1,0,1,3,3,1]])

/*
 10점부터 n발
 */

var answers:[[Int]] = []

func solution(_ n:Int, _ info:[Int]) -> [Int] {
    let history = Array(repeating: 0, count: 11)
    let scores = getScore(depth: 10, apeach: info, lion: history)
    dfs(leftArrow: n, depth: 10, history: history, info: info)
    print(answers)
    return []
}

func dfs(leftArrow:Int,depth:Int,history:[Int],info:[Int]) {
    var newHistory = history

    if leftArrow == 0 {
        answers.append(newHistory)
        return
    }

    if depth == 0 {
        newHistory[newHistory.count-1] = leftArrow
        answers.append(newHistory)
        return
    }

    for i in 0...leftArrow {
        newHistory[depth] = i
        if leftArrow - i < 0 {
            return
        }
        let scores = getScore(depth: depth, apeach: info, lion: newHistory)
        if scores[0] < scores[1] + (0...depth-1).map({$0}).reduce(0, { $0 + $1}) {
        dfs(leftArrow: leftArrow-i, depth: depth-i, history: newHistory, info: info)
        }
    }
}

func getScore(depth:Int,apeach:[Int],lion:[Int]) -> [Int] {

    var scores = Array(repeating: 0, count: 2)

    let reversedApeach = Array(apeach.reversed())
    let reversedLion = Array(lion.reversed())

    for i in 0..<11-depth {
        if reversedApeach[i] == 0 && reversedLion[i] == 0 {
            continue
        }
        if reversedApeach[i] < reversedLion[i] {
            scores[1] += 10-i
        }else {
            scores[0] += 10-i
        }
    }
    return scores
}
//
solution(5,[2,1,1,1,0,0,0,0,0,0,0])
