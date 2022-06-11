/*
 1. num을 string으로 바꿔 각 자리의 숫자를 확인한다.
 2. 만약 1~5,4,6~8,9인지 확인해 각 조건에 맞게 Symbol을 넣어준다.
 
 */

func intToRoman(_ num: Int) -> String {
    let roman = [1:["I","V"],10:["X","L"],100:["C","D"],1000:["M"]]
    let numToString:[String] = String(num).map{String($0)}
    let val:[Int] = [1,10,100,1000]
    var answer:String = ""
    
    for (i,n) in numToString.enumerated() {
        let intN:Int = Int(n) ?? 0
        let key = val[numToString.count - i - 1]
        if 1...3 ~= intN {
            for _ in 0..<intN {
                answer += roman[key]![0]
            }
        }else if intN == 4 {
            answer += roman[key]![0]
            answer += roman[key]![1]
        }else if intN == 5 {
            answer += roman[key]![1]
        }else if 6...8 ~= intN {
            answer += roman[key]![1]
            for _ in 5..<intN {
                answer += roman[key]![0]
            }
        }else if intN == 9 {
            answer += roman[key]![0]
            answer += roman[key*10]![0]
        }
    }
    return answer
}

print(intToRoman(1994))
