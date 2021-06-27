var cases:[[Int]] = []

func permutaion(indexes:[Int],current:Int,pickCount:Int,visited:[Bool],picked:[Int]) {
    
    let initialVisited = visited.isEmpty ? Array(repeating: false, count: indexes.count) : visited
    
    if current == pickCount {
        cases.append(picked)
        return
    }
    
    indexes
        .enumerated()
        .forEach{
            if !initialVisited[$0.offset] {
                var newVisited = initialVisited
                newVisited[$0.offset] = true
                var newPicked = picked
                newPicked.append($0.element)
                permutaion(indexes: indexes, current: current+1, pickCount: pickCount,visited: newVisited,picked: newPicked)
            }
        }
}

permutaion(indexes: [1,2,3], current: 0,pickCount: 3,visited:[],picked: [])
print(cases)
