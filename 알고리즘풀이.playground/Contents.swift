import Foundation

func solution(_ s:[String]) -> [String] {
    return s.map{add110ToRemoveString(str: $0)}
}

func add110ToRemoveString(str:String) -> String {
    var add:String = ""
    var removeString = remove110(str: str,add: &add)
    let index = findLast0(str: removeString)
    removeString.insert(add, at: index)
    return removeString.joined()
}

func findLast0(str:[String]) -> Int {
    for i in stride(from: str.count-1, through: 0, by: -1) {
        if str[i] == "0" {
            return i+1
        }
    }
    return 0
}

func remove110(str:String,add:inout String) -> [String] {
    var stack:[String] = []
    for s in str {
        if stack.count >= 2 && stack[stack.count-2] == "1" && stack[stack.count-1] == "1" && s == "0" {
            stack.removeLast()
            stack.removeLast()
            add += "110"
            continue
        }
        stack.append(String(s))
    }
    return stack
}

solution(["1110","100111100","0111111010"])
