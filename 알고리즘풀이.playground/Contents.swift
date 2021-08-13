var pillars:[[Bool]] = []
var papers:[[Bool]] = []
var pillarLocation:[(Int,Int)] = []
var paperLocation:[(Int,Int)] = []

func solution(_ n:Int, _ build_frame:[[Int]]) -> [[Int]] {
    
    pillars = Array(repeating: Array(repeating: false, count: n+1), count: n+1)
    papers = Array(repeating: Array(repeating: false, count: n+1), count: n+1)
    
    for frame in build_frame {
        let x = frame[0]
        let y = frame[1]
        if frame[3] == 0 {
            if frame[2] == 0 {
                pillars[x][y] = false
                if let index = pillarLocation.firstIndex(where: {$0 == (x,y)}) {
                    pillarLocation.remove(at: index)
                }
                if !checkRightStructure(n: n){
                    pillars[x][y] = true
                    pillarLocation.append((x,y))
                }
            }else {
                papers[x][y] = false
                if let index = paperLocation.firstIndex(where: {$0 == (x,y)}) {
                    paperLocation.remove(at: index)
                }
                if !checkRightStructure(n: n) {
                    papers[x][y] = true
                    paperLocation.append((x,y))
                }
            }
        }else {
            if frame[2] == 0 {
                if checkRightPillars(x:x, y:y) {
                    pillars[x][y] = true
                    pillarLocation.append((x,y))
                }
            }else {
                if checkRightPapers(x:x, y:y,n:n) {
                    papers[x][y] = true
                    paperLocation.append((x,y))
                }
            }
        }
    }
    //result를 조건에 맞게 정렬
    let result = pillarLocation.map{[$0.0,$0.1,0]} + paperLocation.map{[$0.0,$0.1,1]}
    return result.sorted { $0[0] == $1[0] ? $0[1] == $1[1] ? $0[2] < $1[2] : $0[1] < $1[1] : $0[0] < $1[0]
    }
}

//기둥과 보의 상태가 모두 적합한지 확인
    func checkRightStructure(n:Int) -> Bool {
    for paper in paperLocation {
        if !checkRightPapers(x: paper.0, y: paper.1,n: n){
            return false
        }
    }
    for pillar in pillarLocation {
        if !checkRightPillars(x: pillar.0, y: pillar.1) {
            return false
        }
    }
    return true
}


//적합한 기둥의 상태인지 확인
func checkRightPillars(x:Int,y:Int) -> Bool {
    //바닥,기둥 위,보의 왼쪽 위일 경우
    if y == 0 || pillars[x][y-1] || papers[x][y]{
        return true
    }
    //보의 오른쪽 위일 경우
    if x > 0 {
        if papers[x-1][y] {
            return true
        }
    }
    return false
}

//적합한 보의 상태인지 확인
func checkRightPapers(x:Int,y:Int,n:Int) -> Bool {
    //보의 왼쪽이 기둥 위일 경우
    if pillars[x][y-1] {
        return true
    }
    if x < n {
        //보의 오른쪽이 기둥 위일 경우
        if pillars[x+1][y-1]{
            return true
        }
    }
    if x > 0 && x < n {
        //양쪽에 보가 있을 경우
        if papers[x-1][y] && papers[x+1][y]{
            return true
        }
    }
    return false
}

solution(5, [[1,0,0,1],[1,1,1,1],[2,1,0,1],[2,2,1,1],[5,0,0,1],[5,1,0,1],[4,2,1,1],[3,2,1,1]])

