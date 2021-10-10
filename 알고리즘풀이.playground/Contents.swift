import Foundation

struct Truck {
    var gold:Int
    var silver:Int
    var weight:Int
    var time:Int64
}

func solution(_ a:Int, _ b:Int, _ g:[Int], _ s:[Int], _ w:[Int], _ t:[Int]) -> Int64 {
    
    var gold:Int = a
    var silver:Int = b
    var time:Int64 = 0
    var waitingTrucks:[Int64:[Truck]] = [:]
    
    for (i,time) in t.enumerated() {
        if waitingTrucks[Int64(time)] == nil {
            waitingTrucks[Int64(t[i])] = [Truck(gold: g[i], silver: s[i], weight: w[i], time: Int64(t[i]))]
        }else {
            waitingTrucks[Int64(time)]!.append(Truck(gold: g[i], silver: s[i], weight: w[i], time: Int64(t[i])))
        }
    }
        
    while true {
        time += 1
        if waitingTrucks[time] != nil {
            for truck in waitingTrucks[time]! {
                var newTruck:Truck = truck
                var weight:Int = truck.weight
                if gold > 0 {
                    gold -= truck.gold > 0 ? truck.gold > weight ? weight : truck.gold : 0
                    if truck.gold > 0 {
                        weight = gold < 0 ? weight + gold : weight - truck.gold
                    }
                    newTruck.gold -= weight
                    gold = gold < 0 ? 0 : gold
                }
                if weight > 0 {
                    silver -= truck.silver > 0 ? truck.silver > weight ? weight : truck.silver : 0
                    newTruck.silver -= weight
                }
                if waitingTrucks[time + truck.time*2] == nil {
                    waitingTrucks[time + truck.time*2] = [newTruck]
                }else {
                    waitingTrucks[time + truck.time*2]!.append(newTruck)
                }
                if gold <= 0 && silver <= 0 {
                    return time
                }
            }
        }
    }
}

solution(90, 500, [70,70,0], [0,0,500], [100,100,2], [4,8,1])
solution(10, 10, [100], [100], [7], [10])
