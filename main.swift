import Darwin

func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
    var closest:[([Int],Double)] = []
    for point in points {
        let d = getDistance((0,0),(point[0],point[1]))
        
        if closest.count < k {
            insert((point,getDistance((0,0),(point[0],point[1]))))
        }else {
            if closest.last!.1 > d {
                closest.removeLast()
                insert((point,getDistance((0,0),(point[0],point[1]))))
            }
        }
    }
    
    func insert(_ d:([Int],Double)) {
        if closest.isEmpty {
            closest.append(d)
            return
        }
        
        var left:Int = 0
        var right:Int = closest.count - 1
        
        while left < right {
            let mid:Int = (left + right)/2
            print(closest)
            if closest[left].1...closest[mid].1 ~= d.1 {
                right = mid
            }else {
                left = mid + 1
            }
        }
        
        print(left,right,d.1)
        
        if closest[left].1 >= d.1 {
            closest.insert(d, at: left)
        }else {
            if left == closest.count - 1{
                closest.append(d)
            }else {
                closest.insert(d, at: left+1)
            }
        }
        
    }
    
    return closest.map{$0.0}
}

func getDistance(_ p1:(Int,Int),_ p2:(Int,Int)) -> Double {
    let xSquared:Int = (p2.0 - p1.0) * (p2.0 - p1.0)
    let ySquared:Int = (p2.1 - p1.1) * (p2.1 - p1.1)
    return sqrt(Double(xSquared + ySquared))
}

print(kClosest([[9,0],[7,10],[-4,-2],[3,-9],[9,1],[-5,-1]], 5))
