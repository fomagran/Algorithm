import Foundation

func solution(_ s:[String]) -> [String] {
    var answers:[String] = []
    for str in s {
        let remove = remove110(str: str)
        var new = remove.0
        let index = findLast0(str: new)
        new.insert(remove.1, at: index)
        answers.append(new.joined())
    }
    return answers
}

func findLast0(str:[String]) -> Int {
    for i in stride(from: str.count-1, through: 0, by: -1) {
        if str[i] == "0" {
            return i+1
        }
    }
    return 0
}

func remove110(str:String) -> ([String],String) {
    var stack:[String] = []
    var add:String = ""
    
    for s in str {
        if s == "0" && stack.count >= 2 {
            if stack[stack.count-2] == "1" && stack[stack.count-1] == "1" {
                stack.removeLast()
                stack.removeLast()
                add += "110"
                continue
            }
        }
        stack.append(String(s))
    }
    return (stack,add)
}

solution(["1110","100111100","0111111010"])
