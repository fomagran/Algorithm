func solution(_ survey:[String], _ choices:[Int]) -> String {
    var charDic: [Character:Int] = ["R":0,"T":0,"C":0,"F":0,"J":0,"M":0,"A":0,"N":0]
    
    for i in 0..<survey.count {
        let chars: [Character] = Array(survey[i])

        if choices[i] < 4 {
            charDic[chars[0]]! += 4 - choices[i]
        } else {
            charDic[chars[1]]! += choices[i] - 4
        }
    }
    
    let RT = charDic["R"]! >= charDic["T"]! ? "R" : "T"
    let CF = charDic["C"]! >= charDic["F"]! ? "C" : "F"
    let JM = charDic["J"]! >= charDic["M"]! ? "J" : "M"
    let AN = charDic["A"]! >= charDic["N"]! ? "A" : "N"
    
    return RT + CF + JM + AN
}

print(solution(["AN", "CF", "MJ", "RT", "NA"], [5,3,2,7,5]))
print(solution(["RT","CF","JM","AN","NA"], [1,1,1,2,1]))
print(solution(["TR", "RT", "TR"], [7,1,3]))
