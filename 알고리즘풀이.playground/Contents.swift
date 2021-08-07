typealias Seat = (Int,Int)

func solution(_ places:[[String]]) -> [Int] {
    var answer:[Int] = []
    for place in places {
        var check:Bool = false
        var applicants:[Seat] = []
        var xMap:[[String]] = []
        getSeatLocation(places: place,xMap: &xMap,applicants: &applicants)
        outer:while !applicants.isEmpty {
            let first = applicants.removeFirst()
            for applicant in applicants {
                if getManhattanDistance(p1: first, p2: applicant) <= 2 {
                    if !isKeepDistance(p1: first, p2: applicant,xMap: &xMap) {
                        answer.append(0)
                        check = true
                        break outer
                    }
                }
            }
        }
        if !check {
            answer.append(1)
        }
    }
    return answer
}

func getSeatLocation(places:[String],xMap:inout [[String]],applicants:inout [Seat]) {
    for (y,place) in places.enumerated() {
        xMap.append(place.map{String($0)})
        for (x,p) in place.map({String($0)}).enumerated() {
            if p == "P" {
                applicants.append((x,y))
            }
        }
    }
}

func getManhattanDistance(p1:Seat,p2:Seat) -> Int {
    return abs(p1.0-p2.0) + abs(p1.1-p2.1)
}

func isKeepDistance(p1:Seat,p2:Seat,xMap:inout [[String]]) -> Bool {
    let minX = p1.0 < p2.0 ? p1 : p2
    let minY = p1.1 < p2.1 ? p1 : p2
    if p1.0 == p2.0 {
        return xMap[minY.1+1][p1.0] == "X"
    }else if p1.1 == p2.1 {
        return xMap[p1.1][minX.0+1] == "X"
    }else {
        if p1.0 < p2.0 {
            return xMap[p1.1][p1.0+1] == "X" && xMap[p2.1][p2.0-1] == "X"
        }else {
            return xMap[p2.1][p2.0+1] == "X" && xMap[p1.1][p1.0-1] == "X"
        }
    }
}


solution([["OOOOO", "OOOOO", "OOOOP", "OOOPX", "OOPXP"]])
