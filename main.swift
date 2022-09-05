func carFleet(_ target: Int, _ position: [Int], _ speed: [Int]) -> Int {
    let sortedCars = (0..<position.count).map{[position[$0],speed[$0]]}.sorted{$0[0] > $1[0]}
    var stack = [Double]()
    
    for car in sortedCars {
        let time: Double = Double(target-car[0])/Double(car[1])
        if stack.last ?? -1 < time {
            stack.append(time)
        }
    }
    
    return stack.count
}

print(carFleet(12, [10,8,0,5,3], [2,4,1,1,3]))
