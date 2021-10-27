import Foundation

func solution(_ s:[String]) -> [String] {
    var answers:[String] = []
    for str in s {
        let remove = remove110(str: str)
        var new = remove.0
        
        let index = findLast0(str: new)
        for _ in 0..<remove.1 {
            new.insert("110", at: index)
        }
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

func remove110(str:String) -> ([String],Int) {
    let map = str.map{String($0)}
    var count:Int = 0
    var stack:[String] = []
    
    for i in 0..<map.count {
        stack.append(map[i])
        if stack.count >= 3 {
            if stack[stack.count-3...stack.count-1] == ["1","1","0"] {
                stack.removeLast()
                stack.removeLast()
                stack.removeLast()
                count += 1
            }
        }
    }

    return (stack,count)
}

solution(["1110","100111100","0111111010"])
