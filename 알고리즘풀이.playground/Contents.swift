import Foundation

func solution(_ s:[String]) -> [String] {
    var answers:[String] = []
    for str in s {
        var new:[String] = str.map{String($0)}
        
        while true {
            var last0Index = find111(str: new)
            if last0Index == nil {
                answers.append(new.joined())
                break
            }
            
            if remove110(str: new,last: last0Index!).0 != nil {
                let remove = remove110(str: new,last: last0Index!)
                new = remove.0!
                let index = remove.1 < 0 ? last0Index! : remove.1
                new.insert("1", at: index)
                new.insert("1", at: index+1)
                new.insert("0", at: index+2)
                last0Index! = index + 3
            }else {
                answers.append(new.joined())
                break
            }
        }
    }
    return answers
}

func find111(str:[String]) -> Int? {
    if str.count < 3 {
        return nil
    }
    for i in 0..<str.count - 2 {
        if str[i...i+2].joined() == "111" {
            return i
        }
    }
    return nil
}

func remove110(str:[String],last:Int) -> ([String]?,Int) {
    var map = str
    var back0Index = -1
    if last >= str.count-2  {
        return (nil,back0Index)
    }
    
    for i in last..<str.count-2 {
        if map[i...i+2].joined() == "110" {
            map.remove(at: i)
            map.remove(at: i)
            map.remove(at: i)
            if map.count-1 > i && map[i] == "0" {
                back0Index = i+1
            }
            break
        }
    }
    return str.count == map.count ? (nil,back0Index) : (map,back0Index)
}

solution(["1110","100111100","0111111010"])
