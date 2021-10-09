import Foundation

/*
 시간이 적은 순으로 정렬한다.
 시간이 적은 순으로 금과 은 무게의 최대치를 담는다.
 
 만약 최대 무게보다 금,은의 양이 적거나 같다면 은까지 실는다.
 
 만약 a,b의 금,은 양이 0보다 적거나 같다면 넘어간다.
 */

struct Truck {
    var gold:Int
    var silver:Int
    var weight:Int
    let time:Int
}

func solution(_ a:Int, _ b:Int, _ g:[Int], _ s:[Int], _ w:[Int], _ t:[Int]) -> Int64 {
    
    var trucks:[Truck] = []
    var gold:Int = a
    var silver:Int = b
    var time:Int = 0
    
    for i in 0..<g.count {
        let truck = Truck(gold: g[i], silver: s[i], weight: w[i], time: t[i])
        trucks.append(truck)
    }
    
    trucks.sort{$0.time < $1.time}
    
    while gold > 0 ||  silver > 0 {
        for (i,truck) in trucks.enumerated() {
            var newTruck:Truck = truck
            time += truck.time
            if truck.gold > 0 {
                newTruck.gold -= truck.weight
            }
            
            if truck.silver > 0 {
                
            }
            trucks[i] = newTruck
        }
    }
    
    return -1
}

solution(90, 500, [70,70,0], [0,0,500], [100,100,2], [4,8,1])
