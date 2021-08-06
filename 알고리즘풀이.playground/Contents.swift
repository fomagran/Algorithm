func solution(_ n:Int, _ t:Int, _ m:Int, _ timetable:[String]) -> String {
    var startTime = 540
    var times:[Int] = timetable.map{Int($0.split(separator: ":")[0])!*60 + Int($0.split(separator: ":")[1])!}.sorted(by:<)
    var people:Int = 0
    var last:Int = startTime
    var hour:String = ""
    var minute:String = ""
    
    for _ in 0..<n {
        people = m
        for _ in 0..<m {
            if times.isEmpty || times.first! > startTime { break }
            last = times.removeFirst()
            people -= 1
        }
        startTime += t
    }
    
    startTime = people == 0 ? last-1 : startTime-t
    hour = startTime/60  < 10 ? "0\(startTime/60)" : "\(startTime/60)"
    minute = startTime%60 < 10 ? "0\(startTime%60)" : "\(startTime%60)"
    return hour + ":" + minute
}

solution(10, 60, 45, ["23:59","23:59", "23:59", "23:59", "23:59", "23:59", "23:59", "23:59", "23:59", "23:59", "23:59", "23:59", "23:59", "23:59", "23:59", "23:59"])
