func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var result: [Int] = []
    var genresPlayings: [String: Int] = [:]
    var genresNumbers: [String: [Int: Int]] = [:]
    
    for (i,play) in plays.enumerated() {
        let genre = genres[i]
        genresPlayings[genre, default: 0] += play
        genresNumbers[genre, default: [:]][i] = play
    }
    
    let sortedByPlaying = genresPlayings.sorted { $0.value > $1.value}
    
    for genre in sortedByPlaying {
        let sorted = genresNumbers[genre.key]!.sorted { $0.value == $1.value ? $0.key < $1.key : $0.value > $1.value }
    
        for i in 0..<min(sorted.count, 2) {
            result.append(sorted[i].key)
        }
    }
    
    return result
}

solution(["classic", "pop", "classic", "classic", "pop"],[500, 600, 150, 800, 2500])
