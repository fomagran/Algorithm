import Foundation

//해당 번호가 비어있다면 바로 배정
//해당 번호가 이미 있다면 그 번호보다 크면서 비어있는 가장 작은 번호로 배정
//[...] 왼쪽에 있는 경우 +1 해주고 해당 번호의 값을 클래스로 바꿈.
//[...] 오른쪽에 있는 경우 해당 +1 해주고 해당 부모를 현재 번호로 바꿈.
//양 쪽에 있는 경우 왼쪽의 오른쪽을 더하고 +1 해준 뒤 부모를 왼쪽 부모로 바꿈.
//만약 있는 경우 부모에 값을 더한 값에 +1 해주고 해당 번호를 부모로 업데이트.

class Room {
    var root:Int64,length:Int64
    init(root:Int64,length:Int64) {
        self.root = root
        self.length = length
    }
}

var result:[Int64] = []
var dic:[Int64:Room] = [:]

func solution(_ k:Int64, _ room_number:[Int64]) -> [Int64] {
    for n in room_number {
        check(n)
    }
    return result
}

func check(_ n:Int64) {
    if dic[n] == nil {
        if dic[n-1] != nil && dic[n+1] != nil{
        updateBothSide(n)
        }else if dic[n-1] != nil {
         updateLeftSide(n)
        }else if dic[n+1] != nil {
         updateRightSide(n)
        }else {
            dic[n] = Room(root: n, length: 1)
        }
        result.append(n)
    }else {
        updateOverlap(n)
    }
}

func updateBothSide(_ n:Int64) {
    let newLength = dic[n-1]!.length + dic[n+1]!.length + 1
    dic[n-1]!.length = newLength
    dic[n+1]! = dic[n-1]!
    dic[n] = dic[n-1]
}

func updateLeftSide(_ n:Int64) {
    dic[n-1]!.length += 1
    dic[n] = dic[n-1]!
}

func updateRightSide(_ n:Int64) {
    dic[n+1]!.length += 1
    dic[n+1]!.root = n
    dic[n] = dic[n+1]!
}

func updateOverlap(_ n:Int64) {
    let newNumber = dic[n]!.root + dic[n]!.length
    check(newNumber)
}

print(solution(10, [1,3,4,1,3,1]))



