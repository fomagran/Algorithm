
/*
 
total 구하기
 
 total보다 시작점이 작은 경우
 
 total += 길이
 
 total보다 시작점이 큰 경우
 
 total = 시작점 + 길이
 
 걸린 시간은 시작점부터 토탈까지
 
 */



//1. 0번째와 1번쨰를 합친게 더 크면 더 걸리는 것인가? x
import Foundation

func solution(_ jobs:[[Int]]) -> Int {
    var jobsCopy = jobs
    
    jobsCopy.removeFirst()
    
    let sort = jobsCopy.sorted{ $0.reduce(0){$0 + $1 } < $1.reduce(0){ $0 + $1 } }
    
    var total = jobs.first![0] + jobs.first![1]
    
    var times = [total]
    
    for job in sort {
        if job[0] <= total {
            total += job[1]
        }else{
            total = job[0] + job[1]
        }
        times.append(total - job[0])
    }
    
    return times.reduce(0) { $0 + $1 }/3
}

solution([[0, 3], [1, 9], [2, 6]])
