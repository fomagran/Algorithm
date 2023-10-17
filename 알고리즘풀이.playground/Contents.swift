func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var result: Int = 0
    var truckWeights: [Int] = truck_weights
    var currentWeight: Int = 0
    var bridgeTrucks: [Int: Int] = [:]
    
    while !truckWeights.isEmpty || !bridgeTrucks.isEmpty {
        if bridgeTrucks[result] != nil {
            currentWeight -= bridgeTrucks[result, default: 0]
            bridgeTrucks[result] = nil
        }
        
        if !truckWeights.isEmpty  && currentWeight + truckWeights.first! <= weight {
            let first = truckWeights.removeFirst()
            currentWeight += first
            bridgeTrucks[result + bridge_length] = first
        }
        
        result += 1
    }
    
    
    return result
}

solution(2, 10, [7,4,5,6])
