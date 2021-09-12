/*
 자식:부모 딕셔너리 만들어서 정보 저장
 판매자:금액 딕셔너리
 enroll 이름순대로 result 반환
 */

import Foundation

func solution(_ enroll:[String], _ referral:[String], _ seller:[String], _ amount:[Int]) -> [Int] {
    var parentDic:[String:String] = [:]
    var profitDic:[String:Int] = [:]
    
    for i in 0..<enroll.count {
        profitDic[enroll[i]] = 0
        parentDic[enroll[i]] = referral[i]
    }
    
    for i in 0..<seller.count {
        var tenPercent:Int = amount[i]*100
        var parent:String = seller[i]
        while parent != "-" && tenPercent > 0 {
            profitDic[parent]! += tenPercent - tenPercent/10
            parent = parentDic[parent]!
            tenPercent = tenPercent/10
        }
    }
    return enroll.map{profitDic[$0]!}
}

solution(["john", "mary", "edward", "sam", "emily", "jaimie", "tod", "young"], ["-", "-", "mary", "edward", "mary", "mary", "jaimie", "edward"], ["young", "john", "tod", "emily", "mary"], [12, 4, 2, 5, 10])

solution(["john", "mary", "edward", "sam", "emily", "jaimie", "tod", "young"], ["-", "-", "mary", "edward", "mary", "mary", "jaimie", "edward"], ["sam", "emily", "jaimie", "edward"], [2, 3, 5, 4])
