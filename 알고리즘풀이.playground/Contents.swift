import Foundation

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    var parkInfo:[String:Int] = [:]
    var timeInfo:[String:Int] = [:]
    var feeInfo:[String:Int] = [:]
    let maxTime = 23*60+59
    
    calTimeByRecord(records,&parkInfo, &timeInfo)
    
    for (number,time) in parkInfo {
        if timeInfo[number] == nil {
            timeInfo[number] = maxTime - time
        }else {
            timeInfo[number]! += maxTime - time
        }
    }
    
    for (number,time) in timeInfo {
        feeInfo[number] = getTotalFee(time,fees)
    }
    
    return feeInfo.sorted{$0.key < $1.key}.map{$0.value}
}

func calTimeByRecord(_ records:[String],_ parkInfo:inout [String:Int],_ timeInfo:inout [String:Int]) {
    for record in records {
        let split = record.split(separator: " ")
        let time = String(split[0])
        let number = String(split[1])
        let isIN = split[2] == "IN"
        if isIN {
            parkInfo[number] = changeTimeToMinutes(time)
        }else {
            let out = changeTimeToMinutes(time)
            let minutes = out - parkInfo[number]!
            if timeInfo[number] == nil {
                timeInfo[number] = minutes
            }else {
                timeInfo[number]! += minutes
            }
            parkInfo[number] = nil
        }
    }
}

func getTotalFee(_ minutes:Int,_ fees:[Int]) -> Int {
    let freetime = fees[0]
    let defaultFee = fees[1]
    let perTime = fees[2]
    let fee = fees[3]
    if minutes <= freetime { return defaultFee }
    let c = Int(ceil(Double((minutes - freetime))/Double(perTime)))
    let total = defaultFee + c * fee
    return total
}

func changeTimeToMinutes(_ time:String) -> Int {
    let split = time.split(separator: ":")
    let hours = Int(split[0])!
    let minutes = Int(split[1])!
    return hours*60 + minutes
}

solution([180, 5000, 10, 600], ["05:34 5961 IN", "06:00 0000 IN", "06:34 0000 OUT", "07:59 5961 OUT", "07:59 0148 IN", "18:59 0000 IN", "19:09 0148 OUT", "22:59 5961 IN", "23:00 5961 OUT"])
