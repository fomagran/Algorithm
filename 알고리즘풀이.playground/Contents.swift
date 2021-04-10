/*
 시작 시간과 끝나는 시간을 초로 바꿔서 담아놓음
 
 전체 시간을 초당으로 끊어서 순회함.
 
 가장 많은 겹치는 시작 부분을 찾아서 반환.
 
 */

import Foundation

func solution(_ play_time:String, _ adv_time:String, _ logs:[String]) -> String {
    
    var isContainStart:Bool = false
    var isContainEnd:Bool = false
    var maxSeconds:Int = 0
    var maxStart:String = String()
    
    var logsSeconds:[[Int]] = Array(repeating: [Int](), count: logs.count)
    
    let playTimeSeconds = makeSeconds(time: play_time)
    
    let advTimeSeconds = makeSeconds(time: adv_time)
    
    for (i,log) in logs.enumerated() {
        let startEnd = splitPlaytime(playtime: log)
        logsSeconds[i] = [makeSeconds(time: startEnd.0),makeSeconds(time: startEnd.1)]
    }
    
    for i in 0...playTimeSeconds - advTimeSeconds {

        var allPlaySeconds:Int = 0
        isContainStart = false
        isContainEnd = false

        let start = i
        let end = advTimeSeconds + i

        for logSeconds in logsSeconds {

            if logSeconds[0]...logSeconds[1] ~= start {
                isContainStart = true
            }
            if logSeconds[0]...logSeconds[1] ~= end {
                isContainEnd = true
            }

            if isContainStart && isContainEnd {
                allPlaySeconds += end - start
            }else if isContainStart {
                allPlaySeconds += logSeconds[1] - start
            }else if isContainEnd{
                allPlaySeconds += end - logSeconds[0]
            }
            
            
       
        }

        if maxSeconds < allPlaySeconds {
            maxSeconds = allPlaySeconds
            maxStart = makeSecondsToString(seconds: i)
        }

    }
    
    return maxStart
}

func makeSecondsToString(seconds:Int) -> String {
    let hourString = 0...9 ~= seconds/3600 ? "0\(seconds/3600)" : "\(seconds/3600)"
    let minuteString = 0...9 ~= seconds/60%60 ? "0\(seconds/60%60)" : "\(seconds/60%60)"
    let secondString = 0...9 ~= seconds%60 ? "0\(seconds%60)" : "\(seconds%60)"
    
    return "\(hourString):\(minuteString):\(secondString)"
}

func makeSeconds(time:String) -> Int {
    
    let split = time.components(separatedBy: ":")
    let hour = Int(split[0])! * 60 * 60
    let minute = Int(split[1])! * 60
    let second = Int(split[2])!
    
    return hour + minute + second
    
}

func splitPlaytime(playtime:String) -> (String,String) {
    let playtimeSplit = playtime.components(separatedBy: "-")
    let start = playtimeSplit[0]
    let end = playtimeSplit[1]
    
    return (start,end)
}

solution("02:03:55", "00:14:15", ["01:20:15-01:45:14", "00:40:31-01:00:00", "00:25:50-00:48:29", "01:30:59-01:53:29", "01:37:44-02:02:30"])
