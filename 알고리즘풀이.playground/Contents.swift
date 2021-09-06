import Foundation

struct Boxer {
    let index:Int
    let weight:Int
    let winRate:Double
    let moreWeightsWinCount:Int
}

func solution(_ weights:[Int], _ head2head:[String]) -> [Int] {
    var moreWeightsWinCount:[Int] = Array(repeating: 0, count: weights.count)
    let fights:[[String]] = setFightsHistory(moreWeightsWinCount: &moreWeightsWinCount, head2head, weights: weights)
    let boxers = makeBoxers(weights: weights, fights: fights, moreWeightsWinCount: moreWeightsWinCount)
    return sortBoxersIndex(boxers: boxers)
}

func setFightsHistory(moreWeightsWinCount:inout [Int],_ head2head:[String],weights:[Int]) -> [[String]] {
    var fights:[[String]] = Array(repeating: [String](), count: weights.count)
    for (i,head) in head2head.enumerated() {
       let map = head.map{String($0)}
        for (j,m) in map.enumerated() {
            if m == "W" {
                fights[i].append("W")
                if weights[i] < weights[j] {
                    moreWeightsWinCount[i] += 1
                }
            }
            if m == "L" {
                fights[i].append("L")
            }
        }
    }
    return fights
}

func makeBoxers(weights:[Int],fights:[[String]],moreWeightsWinCount:[Int]) -> [Boxer] {
    var boxers:[Boxer] = []
    for (i,w) in weights.enumerated() {
        var winRate:Double = 0
        if fights[i].filter({$0 == "W"}).count > 0 && fights[i].count > 0 {
            winRate = Double(fights[i].filter{$0 == "W"}.count)/Double(fights[i].count)
        }
        let boxer = Boxer(index:i+1,weight: w, winRate: winRate, moreWeightsWinCount: moreWeightsWinCount[i])
        boxers.append(boxer)
    }
    return boxers
}

func sortBoxersIndex(boxers:[Boxer]) -> [Int] {
    return boxers.sorted{
        if $0.winRate == $1.winRate {
            if $0.moreWeightsWinCount == $1.moreWeightsWinCount {
                if $0.weight ==  $1.weight {
                    return $0.index < $1.index
                }else {
                    return $0.weight > $1.weight
                }
            }else {
                return $0.moreWeightsWinCount > $1.moreWeightsWinCount
            }
        }else {
            return $0.winRate > $1.winRate
        }
    }.map{$0.index}
}

solution([50,82,75,120], ["NWWW","LNLL","LWNW","LWLN"])
