import Darwin

struct Point {
    let location: [Int]
    var distance: Int {
        let xSquared:Int = location[0] * location[0]
        let ySquared:Int = location[1] * location[1]
        return xSquared + ySquared
    }
}

func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
    var closest:[Point] = []
    for point in points {
        insert(Point(location: point))
    }
    
    func insert(_ point:Point) {
        
        if closest.isEmpty {
            closest.append(point)
            return
        }
        
        var left: Int = 0
        var right: Int = closest.count - 1
        
        while left <= right {
            let mid: Int = (left + right)/2
            let midDistance: Int = closest[mid].distance
            
            if point.distance == midDistance {
                left = mid
                break
            } else if point.distance > midDistance {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        
        closest.insert(point, at: left)
        
        if closest.count > k {
            closest.removeFirst()
        }
    }
    
    return closest.map{Array($0.location)}
}

print(kClosest([[3,3],[5,-1],[-2,4]]
               ,2))
