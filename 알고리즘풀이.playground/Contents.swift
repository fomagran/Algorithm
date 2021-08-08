import Foundation

var result:[[Int]] = []
var pillars:[[Bool]] = []
var papers:[[Bool]] = []

func solution(_ n:Int, _ build_frame:[[Int]]) -> [[Int]] {
    pillars = Array(repeating: Array(repeating: false, count: 4), count: n)
    papers = Array(repeating: Array(repeating: false, count: 4), count: n)
    
    for frame in build_frame {
        if frame[3] == 0 {
            if frame[2] == 0 {
                if isRemovablePillar(x: frame[0], y: frame[1]) {
                    pillars[frame[1]][frame[0]] = false
                }
            }else {
                if isRemovablePaper(x: frame[0], y: frame[1]) {
                    papers[frame[1]][frame[0]] = false
                }
            }
        }else {
            if frame[2] == 0 {
                if isErectablePillar(x: frame[0], y: frame[1]) {
                    pillars[frame[1]][frame[0]] = true
                }
            }else {
                if isErectablePaper(x: frame[0], y: frame[1]) {
                    papers[frame[1]][frame[0]] = true
                }
            }
        }
    }
    
    for (y,pillar) in pillars.enumerated() {
        for (x,p) in pillar.enumerated() {
            if p {
                result.append([x,y,0])
            }
        }
    }
    
    for (y,paper) in papers.enumerated() {
        for (x,p) in paper.enumerated() {
            if p {
                result.append([x,y,1])
            }
        }
    }
    
    result.sort {
        if $0[0] == $1[0] {
            if $0[1] == $1[1] {
                return $0[2] < $1[2]
            }else {
                return $0[1] < $1[1]
            }
        }else {
            return $0[0] < $1[0]
        }
    }
    
    return result
}

func isErectablePillar(x:Int,y:Int) -> Bool{
    return pillars[y-1][x] || papers[y][x-1] || papers[y][x] || y == 0
}

func isErectablePaper(x:Int,y:Int) -> Bool {
    if pillars[y-1][x] || pillars[y-1][x+1] {
        return true
    }else {
        return papers[y][x-1] && papers[y][x+1]
    }
}

func isRemovablePillar(x:Int,y:Int) -> Bool {
    
    if pillars[y+1][x] {
        return false
    }
   
    if papers[y+1][x] {
        if !papers[y+1][x-1] {
            return false
        }
    }
    
    if papers[y+1][x-1] {
        if !papers[y+1][x+1] {
            return false
        }
    }
    
    return true
}

func isRemovablePaper(x:Int,y:Int) -> Bool {
    
    if papers[y][x+1] || pillars[y][x+1] {
        return false
    }
    
    if papers[y][x-1]{
       if  !pillars[y-1][x-1] {
            return false
        }
    }
    
    if papers[y][x+1]{
       if  !pillars[y-1][x+2] {
            return false
        }
    }
    
    return true
}

solution(5, [[1,0,0,1],[1,1,1,1],[2,1,0,1],[2,2,1,1],[5,0,0,1],[5,1,0,1],[4,2,1,1],[3,2,1,1]])
//solution(5, [[0,0,0,1],[2,0,0,1],[4,0,0,1],[0,1,1,1],[1,1,1,1],[2,1,1,1],[3,1,1,1],[2,0,0,0],[1,1,1,0],[2,2,0,1]])
