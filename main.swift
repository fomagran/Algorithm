import Foundation

//해당 번호가 비어있다면 바로 배정
//해당 번호가 이미 있다면 그 번호보다 크면서 비어있는 가장 작은 번호로 배정
//[...] 왼쪽에 있는 경우 +1 해주고 해당 번호의 값을 클래스로 바꿈. 해당 번호 false
//[...] 오른쪽에 있는 경우 해당 +1 해주고 해당 부모를 현재 번호로 바꿈. 해당 번호 false
//양 쪽에 있는 경우 왼쪽의 오른쪽을 더하고 +1 해준 뒤 부모를 왼쪽 부모로 바꿈. 해당 번호 false
//만약 false라면 부모에 값을 더한 값에 +1 해주고 해당 번호를 부모로 업데이트.

class Room {
    var root:Int
    var length:Int
    
    init(root:Int,length:Int) {
        self.root = root
        self.length = length
    }
}

func solution(_ k:Int64, _ room_number:[Int64]) -> [Int64] {
    var result:[Int] = []
    var k:Int = Int(k)
    var dic:[Int:Room] = [:]
    for number in room_number {
        let n = Int(number)
        if dic[n] == nil {
            if dic[n-1] != nil && dic[n+1] != nil{
                
            }else if dic[n-1] != nil {
                
            }else if dic[n+1] != nil {
                
            }else {
                
            }
        }else {
            
        }
    }
    
    return []
}

print(solution(10, [1,3,4,1,3,1]))



