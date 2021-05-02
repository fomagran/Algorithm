import Foundation

func solution(_ n:Int, _ times:[Int]) -> Int64 {
    
    //최소시간,최대시간
    var (min,max) = (Int64(1),Int64(times.max()!) * Int64(n))
    
    //이분탐색 이용해서 심사를 받는데 최소 시간을 구함.
    return binarySearch(times: times, n: n, min: &min, max: &max)
}

func binarySearch(times:[Int],n:Int,min:inout Int64,max: inout Int64) -> Int64 {
    
    //입국심사 최소시간을 담는다.
    var minTime:Int64 = 0
    
    while min <= max {
        //최소와 최대를 합쳐 2로 나눈 중간값
        let mid = (min + max) / 2
        
        //사람수(중간값을 times안에 있는 값으로 나눈 것들의 합)
        let peopleCount = times.map{mid/Int64($0)}.reduce(0,+)
        
        //사람 수가 n보다 크거나 작다면
        if peopleCount >= n {
            
            //최소시간을 중간값으로 바꿈.
            minTime = mid
            
            //최대값을 중간값에 -1로 바꿈
            max = mid - 1
            
        //사람 수가 n보다 작다면
        } else {
            
            //최소값을 중간값에 +1로 바꿈
            min = mid + 1
        }
    }
    
    //입국심사 최소시간을 반환
    return minTime
}

solution(6, [1,2,3,7,10])
