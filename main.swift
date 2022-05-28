func merge(_ intervals: [[Int]]) -> [[Int]] {
    let sorted:[[Int]] = intervals.sorted{$0[1] > $1[1]}
    var answer:[[Int]] = []
    
outer:for itv in sorted {
    for (i,newItv) in answer.enumerated() {
        if newItv[0] <= itv[1] {
            answer[i] = [min(itv[0],newItv[0]),newItv[1]]
            continue outer
        }
    }

    answer.append(itv)
}
    return answer
}

print(merge([[1,3],[2,6],[8,10],[15,18]]))
