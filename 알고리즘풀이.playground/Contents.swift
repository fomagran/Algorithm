import Foundation

func solution(_ sticker:[Int]) -> Int{
    if sticker.count < 4 { return sticker.max()!}
    var dp1:[Int] = [sticker[0],sticker[0]]
    var dp2:[Int] = [0,sticker[1]]
    
    for i in 2..<sticker.count {
        dp1.append(max(dp1[i-2]+sticker[i],dp1[i-1]))
        dp2.append(max(dp2[i-2]+sticker[i],dp2[i-1]))
    }
    dp1.removeLast()
    return max(dp1.max()!,dp2.max()!)
}

solution([14,6,5,11,3,9,2,10])
