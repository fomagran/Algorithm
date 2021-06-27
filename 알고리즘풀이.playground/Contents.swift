var cases:[[Int]] = []

func combination(indexes: [Int], pickCount: Int, current: Int, picked: [Int]) {
    
    if current == pickCount {
        cases.append(picked)
        return
    }else if current == indexes.count {
        return
    }
    
    var newPicked = picked
    newPicked.append(indexes[current])
    combination(indexes: indexes, pickCount: pickCount-1, current: current+1, picked: newPicked)
    combination(indexes: indexes, pickCount: pickCount, current: current+1, picked: picked)
    
}

print(cases)

