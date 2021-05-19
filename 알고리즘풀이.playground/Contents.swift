import Foundation

func solution(_ lines:[String]) -> Int {
    //최대 요청시간을 구해 반환해줌.
    return findMaxRequestCount(requests: appendRequests(lines: lines))
}

//시작시간을 구함.
func calculateStartTime(line:String,end:Float) -> Float {
    
    //처리시간
    var duringTime = line.split(separator: " ")[2]
    //처리시간에서 s를 빼준다.
    duringTime.removeLast()
    //끝시간에서 처리시간을 빼고 0.001을 더해줌.
    return end - Float(duringTime)! + 0.001
}

//끝시간을 구함.
func calculateEndTime(line:String) -> Float {
    //line에서 시간만 분리해줌
    let timeString = line.split(separator: " ")[1]
    //시,분,초로 나눠줌
    let time = timeString.split(separator: ".")[0].split(separator: ":")
    //시,분,초를 초로 변환
    let (h,m,s) = (Int(time[0])!*3600,Int(time[1])!*60,Int(time[2])!)
    //소수점
    let decimalPoint = timeString.split(separator: ".")[1]
    //초와 소수점을 합쳐서 반환
    return Float("\((h+m+s)).\(decimalPoint)")!
}

//요청의 시작과 끝을 모아준다.
func appendRequests(lines:[String]) -> [(Float,Float)] {
    //요청의 시작과 끝을 담을 변수
    var requests = [(Float,Float)]()
    //lines을 순회
    lines.forEach{
        //요청의 끝시간
        let end = calculateEndTime(line: $0)
        //요청의 시작시간
        let start = calculateStartTime(line: $0, end: end)
        //시작과 끝을 튜플로 담아서 넣어줌. (end시간에 1을 더해주는 이유는 1초간의 갯수를 구하기때문)
        requests.append((start,end + 1))
    }
    //요청을 반환
    return requests
}

//최대요청갯수를 구함.
func findMaxRequestCount(requests:[(Float,Float)]) -> Int {
    //요청갯수만큼 배열을 만들어줌. 자기 자신은 포함하니 1을 넣어줌
    var counts = Array(repeating: 1, count: requests.count)
    //요청들을 순회
    for (i,request) in requests.enumerated() {
        //요청들 중 i번째 이후로 현재 요청의 끝보다 작은 것들의 갯수를 더해줌.
        counts[i] += requests[(i+1)...].filter{request.1 > $0.0}.count
    }
    //갯수 중 가장 최대값을 반환
    return counts.max() ?? 0
}

print(solution([
    "2016-09-15 20:59:57.421 0.351s",
    "2016-09-15 20:59:58.233 1.181s",
    "2016-09-15 20:59:58.299 0.8s",
    "2016-09-15 20:59:58.688 1.041s",
    "2016-09-15 20:59:59.591 1.412s",
    "2016-09-15 21:00:00.464 1.466s",
    "2016-09-15 21:00:00.741 1.581s",
    "2016-09-15 21:00:00.748 2.31s",
    "2016-09-15 21:00:00.966 0.381s",
    "2016-09-15 21:00:02.066 2.62s"
    ]))


