var cases:[[Int]] = []

func combination(indexes: [Int], pickCount: Int, current: Int, picked: [Int],visited:[Bool]) {
    var initialVisited:[Bool] = visited.isEmpty ? Array(repeating: false, count: indexes.count) : visited
    
    if current == pickCount {
        cases.append(picked)
        return
    }
    
    indexes
        .enumerated()
        .forEach{
            if !initialVisited[$0.offset] {
                initialVisited[$0.offset] = true
                var newPicked = picked
                newPicked.append($0.element)
                combination(indexes: indexes, pickCount: pickCount, current: current+1, picked: newPicked,visited: initialVisited)
            }
        }
}

combination(indexes: [1,2,3,4,5], pickCount: 3, current: 0, picked: [], visited: [])
print(cases)

